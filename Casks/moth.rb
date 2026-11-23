cask "moth" do
  version "0.27.5"
  sha256 "c484c008edd56dbef564cd512a885ba3549b1ca9e9c84c807865a270a01a81ce"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-39aa87fe6824-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
