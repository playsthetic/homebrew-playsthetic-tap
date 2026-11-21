# frozen_string_literal: true

cask "peel" do
  version "1.7.0"
  sha256 "f8b15b3b9f12bce9595af58ede246252386ba02a2647b2e7cffa6d37a033147f"

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
