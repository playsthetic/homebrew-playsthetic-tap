# frozen_string_literal: true

cask "reporama" do
  version "0.9.0"
  sha256 "b26d5e9fa28dbd15af5c569e82f30056aba5241cf3c72122c57462d66b045e07"

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
