class Govault < Formula
  desc "A secure, encrypted password manager for the terminal"
  homepage "https://github.com/JonathanInTheClouds/govault"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.0/govault-darwin-arm64"
      sha256 "PLACEHOLDER_ARM64_SHA256"

      resource "menubar" do
        url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.0/govault-menubar-darwin-arm64"
        sha256 "PLACEHOLDER_MENUBAR_ARM64_SHA256"
      end

      def install
        bin.install "govault-darwin-arm64" => "govault"

        resource("menubar").stage do
          bin.install "govault-menubar-darwin-arm64" => "govault-menubar"
        end
      end
    end

    on_intel do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.0/govault-darwin-amd64"
      sha256 "PLACEHOLDER_AMD64_SHA256"

      resource "menubar" do
        url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.0/govault-menubar-darwin-amd64"
        sha256 "PLACEHOLDER_MENUBAR_AMD64_SHA256"
      end

      def install
        bin.install "govault-darwin-amd64" => "govault"

        resource("menubar").stage do
          bin.install "govault-menubar-darwin-amd64" => "govault-menubar"
        end
      end
    end
  end

  test do
    assert_match "GoVault", shell_output("#{bin}/govault --help")
    assert_match version.to_s, shell_output("#{bin}/govault --version")
    assert_match "GoVault", shell_output("#{bin}/govault-menubar --help")
    assert_match version.to_s, shell_output("#{bin}/govault-menubar --version")
  end
end