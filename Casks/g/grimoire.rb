# frozen_string_literal: true

cask "grimoire" do
  version "0.7.0"
  sha256 "136932ead9fbb52ee51374063ca538ebb6fe23a944ecc1f2231c0634966a8069"

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
