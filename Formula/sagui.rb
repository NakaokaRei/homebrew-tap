class Sagui < Formula
  desc "CLI for programmatically controlling macOS mouse and keyboard (SwiftAutoGUI)"
  homepage "https://github.com/NakaokaRei/SwiftAutoGUI"
  url "https://github.com/NakaokaRei/SwiftAutoGUI/archive/refs/tags/0.22.0.tar.gz"
  sha256 "eac391181cd86fdf6e829f74910154ee289c6fa87ae69ec76916f96241d3f1bb"
  license "MIT"
  head "https://github.com/NakaokaRei/SwiftAutoGUI.git", branch: "master"

  depends_on :macos
  depends_on xcode: ["15.0", :build]

  def install
    system "swift", "build",
                    "--disable-sandbox",
                    "-c", "release",
                    "--product", "sagui"
    bin.install ".build/release/sagui"
  end

  def caveats
    <<~EOS
      sagui controls the mouse and keyboard via CoreGraphics event injection,
      which requires Accessibility permissions.

      Grant access in:
        System Settings → Privacy & Security → Accessibility

      Add your terminal application (Terminal, iTerm2, etc.) to the list.
    EOS
  end

  test do
    assert_match "sagui", shell_output("#{bin}/sagui --help")
  end
end
