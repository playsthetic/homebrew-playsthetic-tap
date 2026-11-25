# frozen_string_literal: true

cask "playa" do
  version "1.9.0"
  sha256 "4907d7f6e17e38bdc52d43f5c5c8b7e45fd0869eb9941d16556c5583e83e9218"

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
