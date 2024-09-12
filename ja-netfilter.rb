class JaNetfilter < Formula
  
  version "latest"
  sha256 "0ec13c9ea7a53e8fbb317cd3e08e989ea0dc3ad02c590ad4d36a68ab1cd71800"


  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"

  def post_install
    system_command "#{HOMEBREW_PREFIX}/ja-netfilter/scripts/install.sh", sudo: true
  end

  def pre_uninstall
    system_command "#{HOMEBREW_PREFIX}/ja-netfilter/scripts/uninstall.sh", sudo: true
  end

end
