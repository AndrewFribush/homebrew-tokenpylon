# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.20"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.20/tokenpylon_0.6.20_darwin_arm64.tar.gz"
      sha256 "f22e69368761a2541c4aeaf8f465e6ef95aaff587d9a73ef7b439b403c06b20e"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.20/tokenpylon_0.6.20_darwin_amd64.tar.gz"
      sha256 "a5cb7c76ef3d8bd422d3025ec7a98904d1b1acebbdeab3ca99c942519d61a658"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.20/tokenpylon_0.6.20_linux_arm64.tar.gz"
      sha256 "f8936ef0e0bdc1c20684ac74b0e2997057b5ae10a09e0d61834d019444dee3c7"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.20/tokenpylon_0.6.20_linux_amd64.tar.gz"
      sha256 "d790538766e41809b891a3861d4674ebbf8b53430916b6d0bffb4a317b951568"
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
