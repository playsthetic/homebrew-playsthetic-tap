# frozen_string_literal: true

cask "rollpaper" do
  version "1.6.0"
  sha256 "767146d6a2d0de9b3cffb18c9bab71d05c883dbf81cd40c6867c0360db70aff2"

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
