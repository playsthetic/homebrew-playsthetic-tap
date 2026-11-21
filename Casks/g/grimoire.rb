# frozen_string_literal: true

cask "grimoire" do
  version "0.8.0"
  sha256 "42572d808c49a69a1e2919925811328f055f7ce0d94ca9a16850c5a0b0d9333d"

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
