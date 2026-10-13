# frozen_string_literal: true

cask "gifted" do
  version "0.6.0"
  sha256 "33866903c21eb2ae0212097601d376f55bb7a67ad6057bd58710cfb8190e5dbc"

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
