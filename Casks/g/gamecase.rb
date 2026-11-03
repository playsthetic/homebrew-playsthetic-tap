# frozen_string_literal: true

cask "gamecase" do
  version "1.1.0"
  sha256 "b90afeaa2469dc352df7696d6b880ab53cfce3811a17dcb70ab8761c72c96fa8"

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
