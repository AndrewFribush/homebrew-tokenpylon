# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.23"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.23/tokenpylon_0.6.23_darwin_arm64.tar.gz"
      sha256 "2d1385ba3b409884f5a9e9a14b2b8e8ba2b53e95aca03e68ca4de6cb7f83862c"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.23/tokenpylon_0.6.23_darwin_amd64.tar.gz"
      sha256 "14ebf257126fa18628667a1d4dd6684fcbf7202b0306ad6fd166eca3612342dd"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.23/tokenpylon_0.6.23_linux_arm64.tar.gz"
      sha256 "b6726af8300b9387025b92e4005b0ebeb899b9d9cb3d7e2fa6f32766b97da3eb"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.23/tokenpylon_0.6.23_linux_amd64.tar.gz"
      sha256 "460d562eb11585ea4a97b08b692291f4507feb58c06bbd64f36b4256096e8e67"
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
