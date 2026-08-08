class Sagui < Formula
  desc "CLI for programmatically controlling macOS mouse and keyboard (SwiftAutoGUI)"
  homepage "https://github.com/NakaokaRei/SwiftAutoGUI"
  url "https://github.com/NakaokaRei/SwiftAutoGUI/archive/refs/tags/0.28.0.tar.gz"
  sha256 "cb3218c1475701895e86c6bca13b8fc0d214356e73dcedc7fc6fa0c90442bf58"
  license "MIT"
  head "https://github.com/NakaokaRei/SwiftAutoGUI.git", branch: "master"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on xcode: ["15.0", :build]
  depends_on :macos

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
