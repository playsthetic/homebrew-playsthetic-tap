# frozen_string_literal: true

cask "gamecase" do
  version "1.4.0"
  sha256 "e1d80778026e7381710a3fb0bf4f41b1dbc3f69fb8a369b2d60da5e82bf59f7f"

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
