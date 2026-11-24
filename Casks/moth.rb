cask "moth" do
  version "0.27.6"
  sha256 "6caef337d727521701b0665c059fee83103fd94bf7b7be039b1bd470bb805edb"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-edd7c05c6619-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
