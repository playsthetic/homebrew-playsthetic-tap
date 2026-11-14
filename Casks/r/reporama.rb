# frozen_string_literal: true

cask "reporama" do
  version "0.10.0"
  sha256 "1c53cb3058fc61b3bb4a4c81cbb2d756924128abe2d5c06b93501e6ef8e895ce"

  url "https://api.playsthetic.com/v1/reporama/download/#{version}/aarch64-apple-darwin"
  name "Reporama"
  desc "Visual diffs for binary files in Git"
  homepage "https://playsthetic.com/reporama"

  livecheck do
    url "https://api.playsthetic.com/v1/reporama"
    strategy :json do |json|
      json["latest"]
    end
  end

  depends_on macos: :ventura

  app "Reporama.app"

  zap trash: [
    "~/Library/Application Support/com.playsthetic.reporama",
    "~/Library/Caches/com.playsthetic.reporama",
    "~/Library/Preferences/com.playsthetic.reporama.plist",
  ]
end
