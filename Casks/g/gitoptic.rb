# frozen_string_literal: true

cask "gitoptic" do
  version "0.6.0"
  sha256 "34bdab47b89d4161afa24de75b89f54447e58f1b64dbdb805f083ebbf8d8d928"

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
