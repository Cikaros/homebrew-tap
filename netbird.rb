# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.20.6"
  license "BSD3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.6/netbird_0.20.6_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "a14c88b39c594c6a39e81f3e565f012cb28a04b4066c08b399776be200038bce"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.6/netbird_0.20.6_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "81156c1f5ae73ba887b09e655e73cbf2902b457b0fe17d075b493555fdb733e3"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.6/netbird_0.20.6_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "7f26b2932393a1bb84cdccd6405b03bd8e3dad625ea5f9d2c9f18d14f155339a"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.6/netbird_0.20.6_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "a0ea52c4e6780dc9ca9778415b3929b08253481379ede3948419538da64e7a3f"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.20.6/netbird_0.20.6_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "23c03b7279ac3cc6dd5548377605b89f2c8c84d4264a6c9cd88ec854fec6db68"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
