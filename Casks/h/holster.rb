# frozen_string_literal: true

cask "holster" do
  version "0.1.0"
  sha256 "d7334e9b88dddf2f68c5d324ca9387364b7694557aaa10959fc25828fa7c4bbb"

  url "https://api.playsthetic.com/v1/holster/download/#{version}/aarch64-apple-darwin"
  name "Holster"
  desc "Dock and app switcher in a ring under the pointer"
  homepage "https://playsthetic.com/"

  livecheck do
    url "https://api.playsthetic.com/v1/holster"
    strategy :json do |json|
      json["latest"]
    end
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Holster.app"

  zap trash: [
    "~/Library/Caches/com.playsthetic.holster",
    "~/Library/HTTPStorages/com.playsthetic.holster",
    "~/Library/Preferences/com.playsthetic.holster.plist",
  ]
end
