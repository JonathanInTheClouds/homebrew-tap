class Gocryptic < Formula
  desc "A feature-rich cryptographic CLI toolkit"
  homepage "https://github.com/JonathanInTheClouds/gocryptic"
  version "1.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/gocryptic/releases/download/v1.2.1/gocryptic-darwin-arm64"
      sha256 "ff6c31d3ced783214c004b4edfa341b9873b003b52ca404549abdf1bfd65cadf"

      def install
        bin.install "gocryptic-darwin-arm64" => "gocryptic"
      end
    end

    on_intel do
      url "https://github.com/JonathanInTheClouds/gocryptic/releases/download/v1.2.1/gocryptic-darwin-amd64"
      sha256 "81ab30ec91aa0b4c8b626a499f493524e1b3a8b63aed07e87c2adbbebf0f755c"

      def install
        bin.install "gocryptic-darwin-amd64" => "gocryptic"
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