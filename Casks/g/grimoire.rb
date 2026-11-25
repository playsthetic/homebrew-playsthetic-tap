# frozen_string_literal: true

cask "grimoire" do
  version "0.9.0"
  sha256 "6f596ef80e2dfa2fc2ab7af049e5d3bd590d3bc10913e533c35e6feb88cc1d6a"

  url "https://api.playsthetic.com/v1/grimoire/download/#{version}/aarch64-apple-darwin"
  name "Grimoire"
  desc "Read the comics you already own"
  homepage "https://playsthetic.com/grimoire"

  livecheck do
    url "https://api.playsthetic.com/v1/grimoire"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :tahoe

  app "Grimoire.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.grimoire",
    "~/Library/Containers/com.playsthetic.grimoire",
  ]
end
