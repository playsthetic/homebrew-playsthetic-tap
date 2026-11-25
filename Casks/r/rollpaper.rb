# frozen_string_literal: true

cask "rollpaper" do
  version "1.9.0"
  sha256 "d19e11a70bd6bfed52e2e1d154800aaa1688aa0b2726f67b4593c32a6e966bdd"

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
