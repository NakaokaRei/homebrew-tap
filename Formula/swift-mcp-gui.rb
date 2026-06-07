class SwiftMcpGui < Formula
  desc "MCP server for controlling macOS mouse, keyboard, and screen (SwiftAutoGUI)"
  homepage "https://github.com/NakaokaRei/swift-mcp-gui"
  url "https://github.com/NakaokaRei/swift-mcp-gui/archive/refs/tags/0.2.0.tar.gz"
  sha256 "6e4f3e5978779124a3a091985a111d3a92946e76180a604bf8fc941814ce6868"
  license "MIT"
  head "https://github.com/NakaokaRei/swift-mcp-gui.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on xcode: ["26.5", :build]
  depends_on :macos

  def install
    system "swift", "build",
                    "--disable-sandbox",
                    "-c", "release",
                    "--product", "swift-mcp-gui"
    bin.install ".build/release/swift-mcp-gui"
  end

  def caveats
    <<~EOS
      swift-mcp-gui is an MCP (Model Context Protocol) server that controls the
      mouse, keyboard, and screen via CoreGraphics event injection. It requires
      Accessibility and Screen Recording permissions.

      Grant access in:
        System Settings → Privacy & Security → Accessibility
        System Settings → Privacy & Security → Screen Recording

      Add the MCP client application (Claude Desktop, etc.) to both lists.

      Configure your MCP client to launch swift-mcp-gui over stdio, e.g.:

        {
          "mcpServers": {
            "swift-mcp-gui": {
              "command": "#{HOMEBREW_PREFIX}/bin/swift-mcp-gui"
            }
          }
        }
    EOS
  end

  test do
    assert_path_exists bin/"swift-mcp-gui"
  end
end
