# frozen_string_literal: true

cask "gamecase" do
  version "1.5.0"
  sha256 "ade90336378673d15dcee0e7b631af58f9cedfa4a2b6cd5cb4bb120e20186f34"

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
