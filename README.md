# homebrew-tap

A [Homebrew](https://brew.sh) tap for CLI tools by [@NakaokaRei](https://github.com/NakaokaRei).

## Usage

```bash
brew tap NakaokaRei/tap
brew install <formula>
```

## Available formulae

### sagui

CLI for programmatically controlling the macOS mouse and keyboard, built on
[SwiftAutoGUI](https://github.com/NakaokaRei/SwiftAutoGUI).

```bash
brew install NakaokaRei/tap/sagui
```

After install, grant Accessibility permissions in
**System Settings → Privacy & Security → Accessibility** to your terminal app.

```bash
sagui key shortcut command c
sagui mouse move --x 100 --y 200
sagui screen screenshot --output capture.png
```

## License

Each formula's source is licensed under its upstream project's terms.
The formulae in this repository are released under the MIT License.
