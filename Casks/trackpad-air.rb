cask "trackpad-air" do
  version "0.2.1"
  sha256 "08fcefa4bd5235fdc9fe3566899835f933c4bf27914d99b5cbb6214211b4d40b"

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
