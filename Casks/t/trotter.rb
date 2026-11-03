# frozen_string_literal: true

cask "trotter" do
  version "0.6.0"
  sha256 "98ca7a03c55b26cf13ea0fa801e69b21449c8235b0ea87faecc99721229451a9"

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
