# frozen_string_literal: true

cask "gamecase" do
  version "1.2.0"
  sha256 "4380f2bae2ae6ed7ddafedfd6d2e42a8038fce3bc61df920776052c2b87729e0"

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

  depends_on macos: :sonoma

  app "Gamecase.app"

  zap trash: [
    "~/Library/Application Support/Gamecase",
    "~/Library/Caches/Gamecase",
    "~/Library/Preferences/com.playsthetic.gamecase.plist",
  ]
end
