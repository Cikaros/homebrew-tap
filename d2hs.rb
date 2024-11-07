class D2hs < Formula
  desc "Small tools for syncing DNS Records with hosts file"
  homepage "https://github.com/Neboer/DNS2HostsSyncer"
  url "https://github.com/Neboer/DNS2HostsSyncer/archive/refs/tags/v2.3.tar.gz"
  sha256 "aebb498656efd57afc674fe7fcc72e6b97c654d2cb29a1a614f8b3338d8575e6"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "nlohmann-json"
  depends_on "spdlog"
  depends_on "argparse"
  depends_on "curl"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args, "-DCURL_LIBRARY=#{Formula["curl"].opt_lib}", "-DCURL_INCLUDE_DIR=#{Formula["curl"].opt_include}"
      system "make"
      system "make", "install"
    end
  end

  service do
    run [opt_bin/"d2hs"]
    keep_alive true
    log_path var/"log/d2hs.log"
    error_log_path var/"log/d2hs-error.log"
  end

  test do
    system bin/"d2hs", "--version"
  end
end
