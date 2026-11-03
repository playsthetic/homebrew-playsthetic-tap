# frozen_string_literal: true

cask "playa" do
  version "1.7.0"
  sha256 "e41beb7e789a3c1ee70fe7feb9cb6cc2f86a6bc50b7ec2e3a30864b59285b6b3"

  url "https://api.playsthetic.com/v1/playa/download/#{version}/aarch64-apple-darwin"
  name "Playa"
  desc "Play your own music"
  homepage "https://playsthetic.com/playa"

  livecheck do
    url "https://api.playsthetic.com/v1/playa"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :tahoe

  app "Playa.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.playa",
    "~/Library/Containers/com.playsthetic.playa",
  ]
end
