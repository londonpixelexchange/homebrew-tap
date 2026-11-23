cask "moth" do
  version "0.27.4"
  sha256 "bd4eba8de3468c75cc1bb6d76c133d14eb44041fdb13b248b3e4c7537d68e0b6"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-969df145b6a9-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
