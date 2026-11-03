# frozen_string_literal: true

cask "grimoire" do
  version "0.6.0"
  sha256 "c3e26d79d4e9fbe805b0cb1209290e407fcc2e5c6fa9c37c0f559fcea9be1cce"

  url "https://api.playsthetic.com/v1/grimoire/download/#{version}/aarch64-apple-darwin"
  name "Grimoire"
  desc "Read the comics you already own"
  homepage "https://playsthetic.com/grimoire"

  livecheck do
    url "https://api.playsthetic.com/v1/grimoire"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :tahoe

  app "Grimoire.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.grimoire",
    "~/Library/Containers/com.playsthetic.grimoire",
  ]
end
