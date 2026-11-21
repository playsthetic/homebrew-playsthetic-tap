# frozen_string_literal: true

cask "reporama" do
  version "0.12.0"
  sha256 "e65cbb4423f226a20f089adf099695e9f69163385e39f0ca46add8b8e57e4572"

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
