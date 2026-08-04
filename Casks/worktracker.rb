cask "worktracker" do
  version "0.1.0"
  sha256 "4898fd54ac918412399d04ef574cc08068796734ec3d5f496cec49a6fc784ce5"

  url "https://github.com/alontzukerman/worktracker/releases/download/v#{version}/WorkTracker-#{version}-arm64.dmg"
  name "WorkTracker"
  desc "Personal macOS menu bar app that tracks how much you're actually working."
  homepage "https://github.com/alontzukerman/worktracker"

  depends_on macos: ">= :big_sur"
  depends_on arch: :arm64

  app "WorkTracker.app"

  zap trash: [
    "~/Library/Application Support/WorkTracker",
    "~/Library/Preferences/com.alontz.worktracker.plist",
    "~/Library/Saved Application State/com.alontz.worktracker.savedState",
  ]

  caveats <<~EOS
    WorkTracker is not notarized by Apple, so install it with:
      brew install --cask --no-quarantine worktracker

    On first launch macOS will ask to allow Automation (to read the frontmost
    app name) and Notifications. Both are optional — time tracking works
    without them.
  EOS
end
