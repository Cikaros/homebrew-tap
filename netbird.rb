# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.9.4"
  license "BSD3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.4/netbird_0.9.4_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "774ff6ff42d9a1746bf67d07b17578376257f28972545c6dd43870e1e41a92d8"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.4/netbird_0.9.4_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "d3aebc49026574bb93a0c3f3c2fb76f2f25335caa71c42585912d80315c1ee6c"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.4/netbird_0.9.4_linux_armv6.tar.gz", :using => CurlDownloadStrategy
      sha256 "80362cae40c07d1077aaee9f9391ccced349fdd3002d64baae37bf5f9bf163a4"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.4/netbird_0.9.4_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "ba1841b4b387677e242570011202b88179a50ba6ef3125367c9f67d214de62e6"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.9.4/netbird_0.9.4_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "55a3bb0af3e8863d6b64f4ebdf9b284edd420ce07f72994dfb42b4180c0670f0"

      def install
        bin.install "netbird"
      end
    end
  end

  conflicts_with "wiretrustee"

  test do
    system "#{bin}/netbird version"
  end
end
