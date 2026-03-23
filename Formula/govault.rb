class Govault < Formula
  desc "A secure, encrypted password manager for the terminal"
  homepage "https://github.com/JonathanInTheClouds/govault"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.0/govault-darwin-arm64"
      sha256 "c85eabdb55aa7c2e9c97d39efe3e7caa8d2fff3a4e825d2622f85f2cf681e01f"

      resource "menubar" do
        url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.0/govault-menubar-darwin-arm64"
        sha256 "e6327fce626016cc0c015ccad00b7c77b2572d383c2255b1cf91b801f7fbf6a3"
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
      sha256 "62f709e683a7206bc64b3e8e67f26a3d7cc0203c060aced25f5fb4d1d3375ff3"

      resource "menubar" do
        url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.0/govault-menubar-darwin-amd64"
        sha256 "a369e1057a032dc4838c7db013e632f0f4753bcd86ff7f6b662d754a681aadec"
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