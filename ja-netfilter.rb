class JaNetfilter < Formula
  
  version "latest"
  sha256 "679897a08b187d783cf7abea1cdd85752f5148404b0fab53de1d4a9b5db7a77c"


  url "https://cikaros.top:443/ja-netfilter#dl.zip"
  desc "JetBrains' dragon slayer"
  homepage "https://cikaros.top"

  def install
    prefix.install Dir["*"]
  end

  def post_install
    vmoptions_dir = "#{opt_prefix}/vmoptions"
    if File.directory?(vmoptions_dir)
      Dir.glob("#{vmoptions_dir}/*.vmoptions").each do |file|
        contents = File.read(file)

        # Remove existing -javaagent line
        new_contents = contents.gsub(/^\-javaagent:.*[\/\\]ja\-netfilter\.jar.*/, "")

        # Append new -javaagent line
        new_contents += "\n-javaagent:#{opt_prefix}/ja-netfilter.jar=jetbrains\n"

        # Write the modified content back to the file
        File.open(file, "w") { |f| f.write(new_contents) }
      end
    else
      ohai "VM options directory not found: #{vmoptions_dir}"
    end

    system "launchctl", "load", "#{HOMEBREW_PREFIX}/etc/launchd.conf.d/homebrew.mxcl.ja-netfilter.plist"
  end

  service do
    run ["/bin/sh", "-c",
         %Q[
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
         ]]
    keep_alive true
    log_path var/"log/ja-netfilter.log"
    error_log_path var/"log/ja-netfilter.err.log"
    name macos: "homebrew.mxcl.ja-netfilter"
  end

  def caveats
    <<~EOS
      To restart cikaros/tap/ja-netfilter after an upgrade:
        brew services restart cikaros/tap/ja-netfilter
      
      升级后请重新启动 cikaros/tap/ja-netfilter :
        brew services restart cikaros/tap/ja-netfilter
    EOS
  end

  def uninstall
    # Uninstall the service plist file
    system "launchctl", "unload", "#{HOMEBREW_PREFIX}/etc/launchd.conf.d/homebrew.mxcl.ja-netfilter.plist"
    system "rm", "#{HOMEBREW_PREFIX}/etc/launchd.conf.d/homebrew.mxcl.ja-netfilter.plist"

    # Clean up log files
    rm_rf "#{var}/log/ja-netfilter.log"
    rm_rf "#{var}/log/ja-netfilter.err.log"
  end

end
