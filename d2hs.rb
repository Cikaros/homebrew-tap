class D2hs < Formula
  desc "Small tools for syncing DNS Records with hosts file"
  homepage "https://github.com/Neboer/DNS2HostsSyncer"
  url "https://github.com/Neboer/DNS2HostsSyncer/archive/refs/tags/v4.1.tar.gz"
  sha256 "63832e9574420473ac2a2e3a35716a1bccf69ef90864d890b79869e981c0e1f3"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "nlohmann-json"
  depends_on "spdlog"
  depends_on "argparse"
  depends_on "curl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DCMAKE_PREFIX_PATH=#{HOMEBREW_PREFIX}", "-DCMAKE_INSTALL_PREFIX=/usr/local"
      system "make"
      bin.install "d2hs"
    end
  end

  service do
    run [opt_bin/"d2hs"]
    run_type :interval
    interval 600
    log_path var/"log/d2hs.log"
    error_log_path var/"log/d2hs-error.log"
  end

  def caveats
    # 提供额外的说明，例如如何卸载定时任务
    <<~EOS
    定时任务已设置，每10分钟执行一次。
    注意：请编写配置文件到`/etc/d2hs/d2hs.json`后通过`brew services start d2hs`启动服务。
    EOS
  end

  test do
    system bin/"d2hs", "-h"
  end
end
