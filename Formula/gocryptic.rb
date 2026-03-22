class Gocryptic < Formula
  desc "A feature-rich cryptographic CLI toolkit"
  homepage "https://github.com/JonathanInTheClouds/gocryptic"
  version "1.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/gocryptic/releases/download/v1.2.0/gocryptic-darwin-arm64"
      sha256 "f09edd57d3e75e3af63577494bcb54e4f3885296306f84e96f3b7abf620505fe"

      def install
        bin.install "gocryptic-darwin-arm64" => "gocryptic"
        generate_completions_from_executable(bin/"gocryptic", "completion")
      end
    end

    on_intel do
      url "https://github.com/JonathanInTheClouds/gocryptic/releases/download/v1.2.0/gocryptic-darwin-amd64"
      sha256 "698fc4dbd8540711acf88ba5b7a8d8cc18a8a8719d934e46626bdfcf4193e5be"

      def install
        bin.install "gocryptic-darwin-amd64" => "gocryptic"
        generate_completions_from_executable(bin/"gocryptic", "completion")
      end
    end
  end

  test do
    assert_match "GoCryptic", shell_output("#{bin}/gocryptic --help")

    # Encrypt and decrypt a string
    ct = shell_output("#{bin}/gocryptic encrypt --algo aes-gcm --input 'brew test' --key 'testpassword'").strip
    pt = shell_output("#{bin}/gocryptic decrypt --input '#{ct}' --key 'testpassword'").strip
    assert_equal "brew test", pt

    # Hash check against known SHA-256 of empty string
    hash = shell_output("#{bin}/gocryptic hash --input ''").split[1]
    assert_equal "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855", hash
  end
end
