class Govault < Formula
  desc "A secure, encrypted password manager for the terminal"
  homepage "https://github.com/JonathanInTheClouds/govault"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.1/govault-darwin-arm64"
      sha256 "8d5f99687235673a38fd0d0ff944b8dc750680c61f4dcdc636b6cefcbe882d7b"

      resource "menubar" do
        url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.1/govault-menubar-darwin-arm64"
        sha256 "ac2f15b4ee949d3c672be14f26fcb3f338fa0801aa898f35d2818c6cdca7b6ec"
      end

      def install
        bin.install "govault-darwin-arm64" => "govault"

        resource("menubar").stage do
          bin.install "govault-menubar-darwin-arm64" => "govault-menubar"
        end
      end
    end

    on_intel do
      url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.1/govault-darwin-amd64"
      sha256 "09f97e8bc64a505296789d310e0e4c3db883b5b4396ab9dfee4b21f269236a48"

      resource "menubar" do
        url "https://github.com/JonathanInTheClouds/govault/releases/download/v0.4.1/govault-menubar-darwin-amd64"
        sha256 "8e9a2c5a52f855642b0b310a9acf0c04feb93ae59e46774a8e65afd4d10f769f"
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