# frozen_string_literal: true

cask "holster" do
  version "0.3.0"
  sha256 "0aa86b58059dfbe45c5fe459c3867caf2ba74c2316251e9677815db400d36423"

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
