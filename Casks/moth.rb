cask "moth" do
  version "0.28.3"
  sha256 "dbf528922254411863d576859a81f80436e03d0d48af6d509fd4687a9dd05be6"

  url "https://getmoth.dev/downloads/macos/Moth-#{version}-6c5741f7022b-arm64.dmg"
  name "Moth"
  desc "Native macOS terminal emulator"
  homepage "https://getmoth.dev/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Moth.app"
end
