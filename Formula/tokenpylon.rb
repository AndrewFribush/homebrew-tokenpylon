# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.31"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.31/tokenpylon_0.6.31_darwin_arm64.tar.gz"
      sha256 "999a1b11df5c0dafd25a9e2c344971ff1975696c1c705d77478d5566052642f9"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.31/tokenpylon_0.6.31_darwin_amd64.tar.gz"
      sha256 "3cbffd851a399a760e93ea00d4e65bd5de03c386c47f90356205fda3b2dbb67f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.31/tokenpylon_0.6.31_linux_arm64.tar.gz"
      sha256 "a9f8a3f5a4e8261ed5616a6979236ca0cc2bd2f566209db1ab3174b1e56b977f"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.31/tokenpylon_0.6.31_linux_amd64.tar.gz"
      sha256 "a2ce197b3a950f63fd1eb3268a0d68b236de6de20446b1a5473f38dfaf9b6ae5"
    end
  end

  def install
    bin.install "tokenpylon"
  end

  service do
    run [opt_bin/"tokenpylon", "serve"]
    keep_alive true
    log_path var/"log/tokenpylon.log"
    error_log_path var/"log/tokenpylon.log"
  end

  test do
    assert_match "tokenpylon", shell_output("#{bin}/tokenpylon version")
  end
end
