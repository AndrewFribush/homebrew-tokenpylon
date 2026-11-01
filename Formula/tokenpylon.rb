# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.26"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.26/tokenpylon_0.6.26_darwin_arm64.tar.gz"
      sha256 "67807ee4fe7d34cfc641409b040a1af41ca35ea5d4ddcb37ea6e3ce086ecd744"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.26/tokenpylon_0.6.26_darwin_amd64.tar.gz"
      sha256 "25196c5da4df9fe6a81c9ec72a6c829bc7c6f48dc740a6469187a08c9b9441d7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.26/tokenpylon_0.6.26_linux_arm64.tar.gz"
      sha256 "359018c51beb4b145d154a0021c59202312eb4bcfc6efd9f3a734315ff8cc8b5"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.26/tokenpylon_0.6.26_linux_amd64.tar.gz"
      sha256 "326497b651df043e68b0fdca59f4d1c6f920c7308b70e04ecc55c294650d85dc"
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
