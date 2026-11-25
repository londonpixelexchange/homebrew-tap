cask "moth" do
  version "0.27.8"
  sha256 "4f9903fcdb4ef12d7eacb860370c40e464dd8e16705118d1edb938793ba06333"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-e48763666bb4-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
