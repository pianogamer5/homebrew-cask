cask "malus" do
  version "3.0.2"
  sha256 "d6c62d6bd5e36f22d04f45cd58425d9ff1b42ef561feeb5979f5e2cafbe79ba3"

  url "https://download.getmalus.com/uploads/malus-#{version.dots_to_underscores}.dmg"
  name "Malus"
  desc "Proxy to help accessing various online media resources/services"
  homepage "https://getmalus.com/"

  livecheck do
    url "https://api.getmalus.com/api/checkDesktopUpdate?type=mac"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :sierra"

  app "Malus.app"

  uninstall rmdir: "/Library/Application Support/Malus"

  zap trash: [
    "~/Library/Application Support/com.getmalus.malus",
    "~/Library/Application Support/Malus",
    "~/Library/Caches/com.getmalus.malus",
    "~/Library/Logs/com.getmalus.malus",
    "~/Library/Preferences/com.getmalus.malus.plist",
    "~/Library/Saved Application State/com.getmalus.malus.savedState",
  ]
end
