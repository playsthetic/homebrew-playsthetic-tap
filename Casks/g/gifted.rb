# frozen_string_literal: true

cask "gifted" do
  version "0.8.0"
  sha256 "97a3a81709e0be78765cafbe4b89e3e1a19c54471fa5299608080da42d8aa901"

  url "https://api.playsthetic.com/v1/gifted/download/#{version}/aarch64-apple-darwin"
  name "Gifted"
  desc "GIF-based infinite music videos reacting to live audio"
  homepage "https://playsthetic.com/gifted"

  livecheck do
    url "https://api.playsthetic.com/v1/gifted"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Gifted.app"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.gifted",
    "~/Library/Caches/com.playsthetic.gifted",
    "~/Library/Preferences/com.playsthetic.gifted.plist",
  ]
end
