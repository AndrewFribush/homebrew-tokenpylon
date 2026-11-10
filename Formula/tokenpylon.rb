# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.33"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.33/tokenpylon_0.6.33_darwin_arm64.tar.gz"
      sha256 "72d5f44b6ab69129bed40c25528ab1fdbe7ce225bdbe4f097837ad63da3d57f0"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.33/tokenpylon_0.6.33_darwin_amd64.tar.gz"
      sha256 "53e437560e743bd8a41ec1b1bafa465072ef38df120a61b85e59b5d4c05a6f0f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.33/tokenpylon_0.6.33_linux_arm64.tar.gz"
      sha256 "4123588186774ba27b4bfbf068ac98fcb768e0b32a97d0dee9f518e183ee150c"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.33/tokenpylon_0.6.33_linux_amd64.tar.gz"
      sha256 "0ffac1b8780a714c836a668cdf948e0b913c3066421e67dfa878fb1d33019c6e"
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
