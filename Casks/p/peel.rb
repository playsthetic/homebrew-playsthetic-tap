# frozen_string_literal: true

cask "peel" do
  version "1.6.0"
  sha256 "e3562c8f5b86721c4c0e7768c8186199771af877a1724384d7e106c6525871d4"

  url "https://api.playsthetic.com/v1/peel/download/#{version}/aarch64-apple-darwin"
  name "Peel"
  desc "Leverageable tagging"
  homepage "https://playsthetic.com/peel"

  livecheck do
    url "https://api.playsthetic.com/v1/peel"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Peel.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.peel",
    "~/Library/Containers/com.playsthetic.peel",
  ]
end
