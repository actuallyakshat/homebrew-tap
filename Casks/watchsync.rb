cask "watchsync" do
  version "0.6.0"
  sha256 "c91e6ddacdf706a9be9d3edad53a756947457cc99f888625c30bea325b2b6b2a"

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
