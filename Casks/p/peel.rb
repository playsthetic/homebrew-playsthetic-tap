# frozen_string_literal: true

cask "peel" do
  version "1.9.0"
  sha256 "4250e2d290b4986284ebeeabac041977b80699e66954ff9bbf8453a383a62268"

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
