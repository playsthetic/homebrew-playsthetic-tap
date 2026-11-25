# frozen_string_literal: true

cask "trotter" do
  version "0.9.0"
  sha256 "ddd94e23ee7481a754a07b9e8efffefc895d139cd179994ebed2340820eea044"

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
