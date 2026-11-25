# frozen_string_literal: true

cask "rollpaper" do
  version "1.8.0"
  sha256 "ebcfdd4c40254ebddeecfe547396bd4c2f2a05122fd0bff84624356928e9b455"

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

  depends_on macos: :tahoe

  app "Rollpaper.app"

  zap trash: [
    "~/Library/Application Support/Rollpaper",
    "~/Library/Caches/com.playsthetic.rollpaper",
    "~/Library/Preferences/com.playsthetic.rollpaper.plist",
  ]
end
