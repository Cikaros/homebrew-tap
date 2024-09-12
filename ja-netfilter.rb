# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class JaNetfilter < Formula
  name "ja-netfilter"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"
  version "latest"
  license "BSD3"

  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  sha256 "0ec13c9ea7a53e8fbb317cd3e08e989ea0dc3ad02c590ad4d36a68ab1cd71800"

  postflight do
    system_command "#{HOMEBREW_PREFIX}/ja-netfilter/scripts/install.sh", sudo: true
  end

  uninstall_preflight do
    system_command "#{HOMEBREW_PREFIX}/ja-netfilter/scripts/uninstall.sh", sudo: true
  end

end
