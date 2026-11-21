# frozen_string_literal: true

cask "trotter" do
  version "0.7.0"
  sha256 "795a3d8d4f295add34639ecd87a96893f222f8cf0955aa72987ae1a8d0d2f13f"

  url "https://api.playsthetic.com/v1/trotter/download/#{version}/aarch64-apple-darwin"
  name "Trotter"
  desc "Trip mapping"
  homepage "https://playsthetic.com/trotter"

  livecheck do
    url "https://api.playsthetic.com/v1/trotter"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :sonoma

  app "Trotter.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.trotter",
    "~/Library/Containers/com.playsthetic.trotter",
  ]
end
