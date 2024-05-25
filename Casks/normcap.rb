cask "normcap" do
  arch arm: "arm64", intel: "x86-64"

  version "0.5.8"
  sha256 arm:   "115bd63f5c3c2023c67b4712942a94d0fbd02e12739cba12b30ba3eb315cb45f",
         intel: "2929a5dcf1973ba38ba0d9613d0357d36a6a38fe8ed90bb160f6152428fa3b40"

  url "https://github.com/dynobo/normcap/releases/download/v#{version}/NormCap-#{version}-#{arch}-macOS.dmg",
      verified: "github.com/dynobo/normcap/"
  name "NormCap"
  desc "OCR powered screen-capture tool"
  homepage "https://dynobo.github.io/normcap/"

  livecheck do
    url "https://github.com/dynobo/normcap"
    strategy :github_latest
  end

  depends_on macos: ">= :sierra"

  app "NormCap.app"

  postflight do
    system_command "xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/NormCap.app"]
  end

  zap trash: [
    "~/Library/Preferences/com.normcap-test.settings.plist",
    "~/Library/Preferences/com.normcap-tests.settings.plist",
    "~/Library/Preferences/com.normcap.settings.plist",
    "~/Library/Preferences/eu.dynobo.normcap.plist",
    "~/Library/Saved Application State/eu.dynobo.normcap.savedState",
  ]
end
