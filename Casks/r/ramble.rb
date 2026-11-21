# frozen_string_literal: true

cask "ramble" do
  version "1.5.0"
  sha256 "184377f73204071f1fa58188b9f23857ee742535e59834ee9a014414497296ba"

  url "https://api.playsthetic.com/v1/ramble/download/#{version}/aarch64-apple-darwin"
  name "Ramble"
  desc "Cross-post with ease"
  homepage "https://playsthetic.com/ramble"

  livecheck do
    url "https://api.playsthetic.com/v1/ramble"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Ramble.app"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.ramble",
    "~/Library/Caches/com.playsthetic.ramble",
    "~/Library/Preferences/com.playsthetic.ramble.plist",
  ]
end
