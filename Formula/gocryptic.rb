class Gocryptic < Formula
  desc "A feature-rich cryptographic CLI toolkit"
  homepage "https://github.com/JonathanInTheClouds/gocryptic"
  version "1.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/JonathanInTheClouds/gocryptic/releases/download/v1.3.0/gocryptic-darwin-arm64"
      sha256 "c5a50d26d9a2357d970d70309727e6ac4355b686624a7432454f302a9fab349b"

      def install
        bin.install "gocryptic-darwin-arm64" => "gocryptic"
      end
    end

    on_intel do
      url "https://github.com/JonathanInTheClouds/gocryptic/releases/download/v1.3.0/gocryptic-darwin-amd64"
      sha256 "cc21a38f867de1cd0e3ee0d8f0df6205c6fe1baa60007f97bf0d2f3e9486c185"

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

    # Hash check against known SHA-256 of "hello"
    hash = shell_output("#{bin}/gocryptic hash --input 'hello'").split[1]
    assert_equal "2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824", hash
  end
end