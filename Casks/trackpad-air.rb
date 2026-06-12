cask "trackpad-air" do
  version "0.2.2"
  sha256 "08ed2dcedd931abe224bfe2b95c46fdc5cb0c2e47c0c00a8d73a4df35e0ed0b4"

  url "https://github.com/NakaokaRei/TrackpadAir/releases/download/#{version}/TrackpadAir.app.zip"
  name "TrackpadAir"
  desc "Control the mouse with hand gestures captured by the camera"
  homepage "https://github.com/NakaokaRei/TrackpadAir"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "TrackpadAir.app"

  caveats <<~EOS
    TrackpadAir requires Camera and Accessibility permissions.

    Grant access in:
      System Settings → Privacy & Security → Camera
      System Settings → Privacy & Security → Accessibility
  EOS
end
