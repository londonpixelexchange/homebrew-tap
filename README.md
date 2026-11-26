# London Pixel Exchange Homebrew tap

Install Moth on Apple silicon with macOS Ventura or later:

```sh
brew install --cask londonpixelexchange/tap/moth
```

For each new Moth release, update the cask version and direct DMG URL, then
set the SHA-256 from the published DMG. Test a fresh install before pushing.

[Visit the Moth website](https://getmoth.dev/)

## Gloam

Install Gloam, an internet radio and music player with an audio-reactive terminal visualiser:

```sh
brew install londonpixelexchange/tap/gloam
gloam https://ice1.somafm.com/groovesalad-128-mp3
```

Python, NumPy, ffmpeg and the audio dependencies are installed automatically.
The formula targets the `v1.1.0` tag in
[londonpixelexchange/gloam](https://github.com/londonpixelexchange/gloam).
For each Gloam release, update the formula tag after publishing the release.
Test a fresh install and run `brew test londonpixelexchange/tap/gloam` before pushing.
