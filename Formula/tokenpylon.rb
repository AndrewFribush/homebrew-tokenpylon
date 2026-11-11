# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.35"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.35/tokenpylon_0.6.35_darwin_arm64.tar.gz"
      sha256 "7360122da94457c393f013030a76e4b4de46b85d9764469352af68b2c1641dde"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.35/tokenpylon_0.6.35_darwin_amd64.tar.gz"
      sha256 "35ceacc14e4f6b2059ffd4c1a023899bacb61791540133832502e8d20a067583"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.35/tokenpylon_0.6.35_linux_arm64.tar.gz"
      sha256 "67ebdcb3ff39c19c0d7fe9d1cc1693ee9e0de9314f1e53e1aa3c8e3d85b0f0fa"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.35/tokenpylon_0.6.35_linux_amd64.tar.gz"
      sha256 "893c28be9b6aec7e23dc8c7d7d8d0237bf5f61e716232d8c1322e783cf790ba8"
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
