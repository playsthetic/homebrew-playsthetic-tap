# frozen_string_literal: true

cask "ramble" do
  version "1.3.0"
  sha256 "400241ebad0dcf7400230b23f82cab56e81b74793b8a080759a63a9d871b3f04"

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
