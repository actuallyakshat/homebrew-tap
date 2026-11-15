cask "watchsync" do
  version "0.5.0"
  sha256 "6dce637a80c6ac73b0569c32cc4f06a03e0abb044e31b7a8cd9fefab631fdf18"

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
