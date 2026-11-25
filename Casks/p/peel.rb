# frozen_string_literal: true

cask "peel" do
  version "1.8.0"
  sha256 "3d937a4e095b492374671c1520fbc1557cfc765d5878667d9921556e93a378fd"

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

  depends_on macos: :tahoe

  app "Peel.app"

  zap trash: [
    "~/Library/Application Scripts/com.playsthetic.peel",
    "~/Library/Containers/com.playsthetic.peel",
  ]
end
