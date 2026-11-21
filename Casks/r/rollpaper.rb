# frozen_string_literal: true

cask "rollpaper" do
  version "1.7.0"
  sha256 "91cd6aef500453726631162e0c09106b70d5c9605adaf5b2eb49282a6f820b99"

  url "https://api.playsthetic.com/v1/rollpaper/download/#{version}/aarch64-apple-darwin"
  name "Rollpaper"
  desc "Menu-bar wallpaper rotator"
  homepage "https://playsthetic.com/rollpaper"

  livecheck do
    url "https://api.playsthetic.com/v1/rollpaper"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :sonoma

  app "Rollpaper.app"

  zap trash: [
    "~/Library/Application Support/Rollpaper",
    "~/Library/Caches/com.playsthetic.rollpaper",
    "~/Library/Preferences/com.playsthetic.rollpaper.plist",
  ]
end
