cask "watchsync" do
  version "0.5.1"
  sha256 "098063abb827fcc7f4ef7d2f311301999a53e30da9aaba1a4b1b4aac0229b468"

  url "https://github.com/actuallyakshat/watchsync/releases/download/v#{version}/WatchSync-#{version}-macos-universal.zip"
  name "WatchSync"
  desc "Watch local movies in sync with friends on separate Macs"
  homepage "https://github.com/actuallyakshat/watchsync"

  depends_on formula: "mpv"
  depends_on formula: "croc"
  depends_on :macos

  app "WatchSync.app"

  # Not Apple-notarized; clear quarantine so macOS opens it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/WatchSync.app"],
        writable_paths: ["WatchSync.app"],
        writable_base:  :appdir
  end
end
