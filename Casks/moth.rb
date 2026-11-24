cask "moth" do
  version "0.27.7"
  sha256 "9ac8fe38c26c4d876990953d03efa2029986687a8dffe42ccb5b08db95b9fa76"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-c5790dbfccb2-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
