# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.24"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.24/tokenpylon_0.6.24_darwin_arm64.tar.gz"
      sha256 "6840792dedd6c68b110e9979b32253c13d10bc7c43782a42b1478214f4e40904"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.24/tokenpylon_0.6.24_darwin_amd64.tar.gz"
      sha256 "7cf14a85463ad790f68ac15e7d3f73fca032814958f7175ea3462878e9bb5dae"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.24/tokenpylon_0.6.24_linux_arm64.tar.gz"
      sha256 "1c766d895e72d2a346b2c3b1dba12cc6ee42c9730a99896dda01a2dbdb528a66"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.24/tokenpylon_0.6.24_linux_amd64.tar.gz"
      sha256 "5b739ec5f1922f7f5a49dc99b720573d4018741da916e898f79c6dd0257ad7f6"
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
