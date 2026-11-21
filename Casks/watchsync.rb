cask "watchsync" do
  version "0.7.1"
  sha256 "46ad7f8fed5fc90892f1676ad33d8ec98fc5c44fe21787d58d53ab843a9dcfdd"

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
