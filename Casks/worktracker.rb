cask "worktracker" do
  version "0.9.6"
  sha256 "0400267505f776d5d7cf3e7235fe98abfee34dba2fcce01856666da34265c235"

  url "https://github.com/alontzukerman/worktracker/releases/download/v#{version}/WorkTracker-#{version}-arm64.dmg"
  name "WorkTracker"
  desc "Personal macOS menu bar app that tracks how much you're actually working."
  homepage "https://github.com/alontzukerman/worktracker"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "WorkTracker.app"

  zap trash: [
    "~/Library/Application Support/WorkTracker",
    "~/Library/Preferences/com.alontz.worktracker.plist",
    "~/Library/Saved Application State/com.alontz.worktracker.savedState",
  ]

  caveats <<~EOS
    WorkTracker is not notarized by Apple, so macOS quarantines it on install.
    Clear that once, or the app won't open:

      xattr -cr /Applications/WorkTracker.app

    On first launch macOS will ask to allow Automation (to read the frontmost
    app name) and Notifications. Both are optional — time tracking works
    without them.
  EOS
end
