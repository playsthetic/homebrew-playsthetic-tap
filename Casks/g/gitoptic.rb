# frozen_string_literal: true

cask "gitoptic" do
  version "0.8.0"
  sha256 "c337404abc354116f89a36d613fcf778f72778b75616f62f7b9278a90be83068"

  url "https://api.playsthetic.com/v1/gitoptic/download/#{version}/aarch64-apple-darwin"
  name "Gitoptic"
  desc "Visual diffs for binary files in Git"
  homepage "https://playsthetic.com/gitoptic"

  livecheck do
    url "https://api.playsthetic.com/v1/gitoptic"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Gitoptic.app"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.gitoptic",
    "~/Library/Caches/com.playsthetic.gitoptic",
    "~/Library/Preferences/com.playsthetic.gitoptic.plist",
  ]
end
