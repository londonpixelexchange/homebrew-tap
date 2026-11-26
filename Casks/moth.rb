cask "moth" do
  version "0.28.2"
  sha256 "429facccbc0ecde78b967087e168201b307e576533b182b11f7fa1463d10f4e9"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-bdb8a8d0a359-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
