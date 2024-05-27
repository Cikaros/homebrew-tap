


# Netbird's UI Client Cask Formula
cask "netbird-ui" do
  version "0.27.10"

  if Hardware::CPU.intel?
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.10/netbird-ui_0.27.10_darwin_amd64_signed.zip"
      sha256 "1ae5e9147f006826ec560deb52a229c05ebe7da4bc743b41161112c539467674"
      app "netbird_ui_darwin_amd64", target: "Netbird UI.app"
  else
      url "https://github.com/netbirdio/netbird/releases/download/v0.27.10/netbird-ui_0.27.10_darwin_arm64_signed.zip"
      sha256 "adcbaa6839aa0cd10cb450f8e5283dc35bd4c4f8fda37024c9b67dde94d2353b"
      app "netbird_ui_darwin_arm64", target: "Netbird UI.app"
  end

  depends_on formula: "netbird"

  postflight do
    set_permissions "/Applications/Netbird UI.app/installer.sh", '0755'
    set_permissions "/Applications/Netbird UI.app/uninstaller.sh", '0755'
  end

  postflight do
    system_command "#{appdir}/Netbird UI.app/installer.sh",
                   args: ["#{version}"],
                   sudo: true
  end

  uninstall_preflight do
    system_command "#{appdir}/Netbird UI.app/uninstaller.sh",
                   sudo: false
  end

  name "Netbird UI"
  desc "Netbird UI Client"
  homepage "https://www.netbird.io/"
end