cask "moth" do
  version "0.28.1"
  sha256 "7ece18dfacf58ac27b1d00e9266930cad08027d57bede3c1b7dffc752304b79e"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-6f530ee98b92-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
