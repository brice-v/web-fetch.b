#!/usr/bin/env blue

from http import {html_to_md, url_parse}

val error_prefix = "web-fetch.b error: ";

var USAGE = """web-fetch.b is a tool for fetching a url

Usage:
    web-fetch.b <url>

    url         the url to fetch content from
                response: markdown by default
    help,-h     prints this usage
""";

fun print_usage_and_exit() {
    print(USAGE);
    exit(0);
}

fun web_fetch(u) {
    val {status, body} = fetch(u);
    if status != 200 {
        if status != 200 {
            println("#{error_prefix}failed to fetch got status code #{status}. Please use this tool responsibly!");
            println("body: #{body}")
            exit(1);
        }
    }
    body
}

fun parse_response(r, scheme, host) {
    var domain = if scheme == "" {
        "https://"+host
    } else {
        scheme+"://"+host
    };
    html_to_md(r, domain)
}

fun main(args) {
    if args.len() < 3 {
        println("#{error_prefix}<url> is required\n    example: web-fetch.b \"https://go.dev\"\n    note: web-fetch.b help for usage");
        exit(1);
    }
    val url = args[2]
    match url {
        "-h" => { print_usage_and_exit() },
        "help" => { print_usage_and_exit() },
        _ => {
            val response = web_fetch(url);
            var parsed_url = url_parse(url);
            val parsed = parse_response(response, parsed_url.scheme, parsed_url.host);
            println(parsed);
            exit(0);
        },
    };
}

main(ARGV)