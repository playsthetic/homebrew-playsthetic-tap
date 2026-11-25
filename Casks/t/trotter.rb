# frozen_string_literal: true

cask "trotter" do
  version "0.8.0"
  sha256 "9a92de5e833feb7031d5da19252da6d07d2ef97d99bb3d0121581736fb72e4ce"

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

  depends_on macos: :tahoe

  app "Trotter.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.trotter",
    "~/Library/Containers/com.playsthetic.trotter",
  ]
end
