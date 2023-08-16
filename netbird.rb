# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Netbird < Formula
  desc "Netbird project."
  homepage "https://netbird.io/"
  version "0.22.5"
  license "BSD3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.5/netbird_0.22.5_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "ec08dbebd2ae1eaf0e7ca061ca16cd6be1684a9eb41a286377934cc59a6b47d6"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.5/netbird_0.22.5_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "e5256b98c1e1619f36845238b853db1b88d5a9c53dd9654e0cb67b0cd165381c"

      def install
        bin.install "netbird"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.5/netbird_0.22.5_linux_armv6.tar.gz", using: CurlDownloadStrategy
      sha256 "a4c3f4e9d72a53b4b329f608e7c3e7569230a2709c28d5e77dc0799c4a934969"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.5/netbird_0.22.5_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "e7783b3a2d7909a6c7eafef95f65a5b24daf60c696c19706640ec4c6d4815ab7"

      def install
        bin.install "netbird"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.22.5/netbird_0.22.5_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "eb916938b501e0959875fce122620767c268580e14f3f81aaaeaa7f3d5371287"

      def install
        bin.install "netbird"
      end
    end
  end

  test do
    system "#{bin}/netbird version"
  end
end
