# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.21"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.21/tokenpylon_0.6.21_darwin_arm64.tar.gz"
      sha256 "e5de50652946e4fbcdce20cf5e629b4a8aed8c0717c30ee9198adaa2006b7e12"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.21/tokenpylon_0.6.21_darwin_amd64.tar.gz"
      sha256 "93ef2d455d677f6b66b83c1cad2418bb184d2a326bffb980b6d0b7caa054bd5b"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.21/tokenpylon_0.6.21_linux_arm64.tar.gz"
      sha256 "bcd946c1a7fa9447e5930eda1c33674e15e44cab5b0137331eb7799d407fc509"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.21/tokenpylon_0.6.21_linux_amd64.tar.gz"
      sha256 "eb771ad24415de48af3699bcee549d9e636eb0f277380bdd31c8c223c995db4b"
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
