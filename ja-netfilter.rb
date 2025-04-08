class JaNetfilter < Formula
  
  version "latest"
  sha256 "1d03ddc5ae841831a02d19623b50bb7ac6d874b9eeb72bd3eb44d65ddb63e07b"


  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"

  def install
    libexec.install Dir["*"]
  end

  post_install script: {
    executable: "#{opt_libexec}/scripts/install.sh",
    sudo:       true,
  }
  
  uninstall script: {
    executable: "#{opt_libexec}/scripts/uninstall.sh",
    sudo:       true,
  }

end
