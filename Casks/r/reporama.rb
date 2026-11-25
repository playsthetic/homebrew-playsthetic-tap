# frozen_string_literal: true

cask "reporama" do
  version "0.13.0"
  sha256 "8eaf71fc70ae35e92c111827e467dfd43542ac9c6b06e2642f56af4b5328563c"

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
