# frozen_string_literal: true

cask "playa" do
  version "1.8.0"
  sha256 "757db078cfce81acd1a9e0bd4001cce3526e16df87ad6792c99455f676e3ad50"

  url "https://api.playsthetic.com/v1/playa/download/#{version}/aarch64-apple-darwin"
  name "Playa"
  desc "Play your own music"
  homepage "https://playsthetic.com/playa"

  livecheck do
    url "https://api.playsthetic.com/v1/playa"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :tahoe

  app "Playa.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.playa",
    "~/Library/Containers/com.playsthetic.playa",
  ]
end
