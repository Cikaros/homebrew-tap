class JaNetfilter < Formula
  
  version "latest"
  sha256 "0ec13c9ea7a53e8fbb317cd3e08e989ea0dc3ad02c590ad4d36a68ab1cd71800"


  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"

  def install
    libexec.install Dir["*"]
  end

  def post_install
    system "echo \"请执行：#{opt_libexec}/scripts/install.sh\n\""
    system "echo \"卸载之前请执行：#{opt_libexec}/scripts/uninstall.sh\n\""
  end

end
