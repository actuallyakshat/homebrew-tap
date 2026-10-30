cask "tars-app" do
  version "0.3.1"
  sha256 "8334309010ad5783849561d735a0a906c2d28baea0c4bb082e35cc3d585abfbd"

  url "https://github.com/actuallyakshat/tars/releases/download/v#{version}/Tars-#{version}-macos-universal.zip"
  name "Tars"
  desc "Desktop app for the task list you and your coding agent share"
  homepage "https://github.com/actuallyakshat/tars"

  depends_on cask: "actuallyakshat/tap/tars"
  depends_on macos: ">= :big_sur"

  app "Tars.app"

  # Not Apple-notarized; clear quarantine so macOS opens it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tars.app"]
  end

  zap trash: ["~/Library/WebKit/com.actuallyakshat.tars", "~/Library/Caches/com.actuallyakshat.tars"]
end
