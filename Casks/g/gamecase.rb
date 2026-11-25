# frozen_string_literal: true

cask "gamecase" do
  version "1.3.0"
  sha256 "c0f3204729717bb20b4ed86b0d7a0e81ee5d182948e4fad4f5431316b004ab4b"

  url "https://api.playsthetic.com/v1/gamecase/download/#{version}/aarch64-apple-darwin"
  name "Gamecase"
  desc "MAME front-end"
  homepage "https://playsthetic.com/gamecase"

  livecheck do
    url "https://api.playsthetic.com/v1/gamecase"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :tahoe

  app "Gamecase.app"

  zap trash: [
    "~/Library/Application Support/Gamecase",
    "~/Library/Caches/Gamecase",
    "~/Library/Preferences/com.playsthetic.gamecase.plist",
  ]
end
