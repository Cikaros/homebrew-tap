class JaNetfilter < Formula
  
  version "latest"
  sha256 "1d03ddc5ae841831a02d19623b50bb7ac6d874b9eeb72bd3eb44d65ddb63e07b"


  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"

  def install
    prefix.install Dir["*"]
  end

  service do
    run ["/bin/sh", "-c",
         %Q[
           launchctl setenv "IDEA_VM_OPTIONS" "#{prefix}/libexec/vmoptions/idea.vmoptions";
           launchctl setenv "CLION_VM_OPTIONS" "#{prefix}/libexec/vmoptions/clion.vmoptions";
           launchctl setenv "PHPSTORM_VM_OPTIONS" "#{prefix}/libexec/vmoptions/phpstorm.vmoptions";
           launchctl setenv "GOLAND_VM_OPTIONS" "#{prefix}/libexec/vmoptions/goland.vmoptions";
           launchctl setenv "PYCHARM_VM_OPTIONS" "#{prefix}/libexec/vmoptions/pycharm.vmoptions";
           launchctl setenv "WEBSTORM_VM_OPTIONS" "#{prefix}/libexec/vmoptions/webstorm.vmoptions";
           launchctl setenv "WEBIDE_VM_OPTIONS" "#{prefix}/libexec/vmoptions/webide.vmoptions";
           launchctl setenv "RIDER_VM_OPTIONS" "#{prefix}/libexec/vmoptions/rider.vmoptions";
           launchctl setenv "DATAGRIP_VM_OPTIONS" "#{prefix}/libexec/vmoptions/datagrip.vmoptions";
           launchctl setenv "RUBYMINE_VM_OPTIONS" "#{prefix}/libexec/vmoptions/rubymine.vmoptions";
           launchctl setenv "APPCODE_VM_OPTIONS" "#{prefix}/libexec/vmoptions/appcode.vmoptions";
           launchctl setenv "DATASPELL_VM_OPTIONS" "#{prefix}/libexec/vmoptions/dataspell.vmoptions";
           launchctl setenv "GATEWAY_VM_OPTIONS" "#{prefix}/libexec/vmoptions/gateway.vmoptions";
           launchctl setenv "JETBRAINS_CLIENT_VM_OPTIONS" "#{prefix}/libexec/vmoptions/jetbrains_client.vmoptions";
           launchctl setenv "JETBRAINSCLIENT_VM_OPTIONS" "#{prefix}/libexec/vmoptions/jetbrainsclient.vmoptions";
           launchctl setenv "STUDIO_VM_OPTIONS" "#{prefix}/libexec/vmoptions/studio.vmoptions";
           launchctl setenv "DEVECOSTUDIO_VM_OPTIONS" "#{prefix}/libexec/vmoptions/devecostudio.vmoptions";
         ]]
    keep_alive true
  end

end
