class Govault < Formula
  desc "A secure, encrypted password manager for the terminal"
  homepage "https://github.com/JonathanInTheClouds/govault"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.2.3/govault-darwin-arm64"
      sha256 "2e970f9eedef61c0974b2ddd32fb266acf8549667f4b168401d1d4c9a923dd0c"

      def install
        bin.install "govault-darwin-arm64" => "govault"
      end
    end

    on_intel do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.2.3/govault-darwin-amd64"
      sha256 "6bb357d4435dff02be6e05c97a11fb242dd87fb55648b155355f367d6dbb8d3f"

      def install
        bin.install "govault-darwin-amd64" => "govault"
      end
    end
  end

  test do
    assert_match "GoVault", shell_output("#{bin}/govault --help")

    # Hash a known string to verify the binary works
    assert_match version.to_s, shell_output("#{bin}/govault --version")
  end
end