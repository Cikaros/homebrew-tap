class JaNetfilter < Formula
  
  version "latest"
  sha256 "679897a08b187d783cf7abea1cdd85752f5148404b0fab53de1d4a9b5db7a77c"


  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"

  def install
    prefix.install Dir["*"]

    # Create a plist file for the service
    (libexec/"ja-netfilter.plist").write <<~EOS
      <?xml version="1.0" encoding="UTF-8"?>
      <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
      <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>jetbrains.vmoptions</string>
        <key>ProgramArguments</key>
        <array>
          <string>sh</string>
          <string>-c</string>
          <string>
            launchctl setenv "IDEA_VM_OPTIONS" "#{opt_prefix}/vmoptions/idea.vmoptions";
            launchctl setenv "CLION_VM_OPTIONS" "#{opt_prefix}/vmoptions/clion.vmoptions";
            launchctl setenv "PHPSTORM_VM_OPTIONS" "#{opt_prefix}/vmoptions/phpstorm.vmoptions";
            launchctl setenv "GOLAND_VM_OPTIONS" "#{opt_prefix}/vmoptions/goland.vmoptions";
            launchctl setenv "PYCHARM_VM_OPTIONS" "#{opt_prefix}/vmoptions/pycharm.vmoptions";
            launchctl setenv "WEBSTORM_VM_OPTIONS" "#{opt_prefix}/vmoptions/webstorm.vmoptions";
            launchctl setenv "WEBIDE_VM_OPTIONS" "#{opt_prefix}/vmoptions/webide.vmoptions";
            launchctl setenv "RIDER_VM_OPTIONS" "#{opt_prefix}/vmoptions/rider.vmoptions";
            launchctl setenv "DATAGRIP_VM_OPTIONS" "#{opt_prefix}/vmoptions/datagrip.vmoptions";
            launchctl setenv "RUBYMINE_VM_OPTIONS" "#{opt_prefix}/vmoptions/rubymine.vmoptions";
            launchctl setenv "APPCODE_VM_OPTIONS" "#{opt_prefix}/vmoptions/appcode.vmoptions";
            launchctl setenv "DATASPELL_VM_OPTIONS" "#{opt_prefix}/vmoptions/dataspell.vmoptions";
            launchctl setenv "GATEWAY_VM_OPTIONS" "#{opt_prefix}/vmoptions/gateway.vmoptions";
            launchctl setenv "JETBRAINS_CLIENT_VM_OPTIONS" "#{opt_prefix}/vmoptions/jetbrains_client.vmoptions";
            launchctl setenv "JETBRAINSCLIENT_VM_OPTIONS" "#{opt_prefix}/vmoptions/jetbrainsclient.vmoptions";
            launchctl setenv "STUDIO_VM_OPTIONS" "#{opt_prefix}/vmoptions/studio.vmoptions";
            launchctl setenv "DEVECOSTUDIO_VM_OPTIONS" "#{opt_prefix}/vmoptions/devecostudio.vmoptions";
          </string>
        </array>
        <key>RunAtLoad</key>
        <true/>
      </dict>
      </plist>
    EOS
  end

  def post_install
    vmoptions_dir = "#{opt_prefix}/vmoptions"
    if File.directory?(vmoptions_dir)
      Dir.glob("#{vmoptions_dir}/*.vmoptions").each do |file|
        inreplace file, /^\-javaagent:.*[\/\\]ja\-netfilter\.jar.*/, ""
      end
    else
      ohai "VM options directory not found: #{vmoptions_dir}"
    end

    # Install the service plist file
    system "cp", "#{libexec}/ja-netfilter.plist", "/Library/LaunchDaemons/jetbrains.vmoptions.plist"
    system "chmod", "644", "/Library/LaunchDaemons/jetbrains.vmoptions.plist"
    system "chown", "root:wheel", "/Library/LaunchDaemons/jetbrains.vmoptions.plist"

    # Load the service
    system "launchctl", "load", "-w", "/Library/LaunchDaemons/jetbrains.vmoptions.plist"
  end

  def uninstall
    # Uninstall the service plist file
    system "launchctl", "unload", "/Library/LaunchDaemons/jetbrains.vmoptions.plist"
    system "rm", "/Library/LaunchDaemons/jetbrains.vmoptions.plist"
  end

end
