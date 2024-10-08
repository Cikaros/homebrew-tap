class JaNetfilter < Formula
  
  version "latest"
  sha256 "1d03ddc5ae841831a02d19623b50bb7ac6d874b9eeb72bd3eb44d65ddb63e07b"


  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"

  def install
    libexec.install Dir["*"]
  end

  def post_install
    system "echo \"请执行：`bash #{opt_libexec}/scripts/install.sh`\""
    system "echo \"卸载之前执行：`bash #{opt_libexec}/scripts/uninstall.sh`\""
  end

end
