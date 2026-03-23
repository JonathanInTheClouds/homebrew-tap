class Govault < Formula
  desc "A secure, encrypted password manager for the terminal"
  homepage "https://github.com/JonathanInTheClouds/govault"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.3.0/govault-darwin-arm64"
      sha256 "e35621d39fb014bec7d9dcea552a474a9114c0394e3a546628327a7f2c01cbbb"

      def install
        bin.install "govault-darwin-arm64" => "govault"
      end
    end

    on_intel do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.3.0/govault-darwin-amd64"
      sha256 "e0a253015545c3e84da966abfeb9f176edcf50eb13e682c4555a6d52f66ede06"

      def install
        bin.install "govault-darwin-amd64" => "govault"
      end
    end
  end

  test do
    assert_match "GoVault", shell_output("#{bin}/govault --help")
    assert_match version.to_s, shell_output("#{bin}/govault --version")
  end
end