cask "moth" do
  version "0.27.3"
  sha256 "0d6e2c354f8812e675b2d56d557453f9147165f472424935bd16b6a029720340"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-finder-0b6eb13e16c7-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
