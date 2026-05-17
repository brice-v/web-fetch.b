# web-fetch.b

A small [blue](https://github.com/brice-v/blue) script for fetching a URL and converting the HTML response to markdown.

## Usage

```bash
web-fetch.b <url>
web-fetch.b help
```

| Argument | Description |
|----------|-------------|
| `<url>`  | The URL to fetch content from (markdown output by default) |
| `help`   | Print usage information |

## Example

```bash
web-fetch.b "https://go.dev"
```

## Requirements

- [Blue](https://github.com/brice-v/blue) (the `blue` interpreter)
- Linux (for shebang)

## License

MIT — see [LICENSE](LICENSE)
