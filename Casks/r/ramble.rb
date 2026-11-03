# frozen_string_literal: true

cask "ramble" do
  version "1.4.0"
  sha256 "0d3fc8cedd4c9a43dfba8d3f5351df09ebed9c25e47be764f140e9521e6d4921"

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
