# frozen_string_literal: true

cask "gitoptic" do
  version "0.7.0"
  sha256 "ed9e809aad86d152d297dc5042a04f023cfe830d3174137acacb066c2031cbfb"

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
