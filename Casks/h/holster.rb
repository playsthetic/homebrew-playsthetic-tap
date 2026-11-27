# frozen_string_literal: true

cask "holster" do
  version "0.2.0"
  sha256 "e9055ae26f4f87f954ed26858388a0f08a9d879f385063b2023129902edd77b2"

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
