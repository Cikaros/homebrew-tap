# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.24.3"
  license "BSD3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.3/netbird_0.24.3_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "e75bf7704b6089522ee9009bd7da9f80db9f92a827957c20f209d584cbff7269"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.3/netbird_0.24.3_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "8d74fe5651572b4cbb54c9d7a2bb2475614dc9e2cdd12de5b7138f6a73accc75"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.3/netbird_0.24.3_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "b2885ddc19bba92f5c8c50043306bb6019dcc89caa69b45cbcf8f1281d6ded37"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.3/netbird_0.24.3_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "4d690212e222ad8c96bdc1317f5b28ee1f4d218c7bfcdba40ed3b5d7b73e19b4"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.24.3/netbird_0.24.3_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "79926811b2a1749af3e96e8a928ebdeed23c39b160fdb7ea08cdf91693f0bd3f"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
