# frozen_string_literal: true

cask "gifted" do
  version "0.7.0"
  sha256 "f5812d58d0d7f0034b275c0ea0dddda05c6de3cb10673c09940299e070e40ecc"

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

  uninstall quit: "com.playsthetic.gifted"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.gifted",
    "~/Library/Caches/com.playsthetic.gifted",
    "~/Library/Preferences/com.playsthetic.gifted.plist",
  ]
end
