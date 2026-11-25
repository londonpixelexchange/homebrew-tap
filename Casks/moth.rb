cask "moth" do
  version "0.28.0"
  sha256 "f4d1a8c2bb4befd2732b7154f0a0f6648c91a5e2a213935747b109f33b4accb9"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-f5d2eb47b89e-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
