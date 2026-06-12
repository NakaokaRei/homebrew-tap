cask "trackpad-air" do
  version "0.2.3"
  sha256 "faeb4241bb9c233bb29249333a8207d01ea1e62a2e528af6a8c1f5405ca639f5"

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
