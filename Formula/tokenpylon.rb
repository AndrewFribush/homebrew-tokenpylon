# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.22"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.22/tokenpylon_0.6.22_darwin_arm64.tar.gz"
      sha256 "0d0190a2832d1ff5ea3a95377391fac7fa995a2f95ae37d7fd0811f4f280847e"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.22/tokenpylon_0.6.22_darwin_amd64.tar.gz"
      sha256 "8730cdae08b1c0fb7053e2d7b27a4d4ad14da8bf83b61ac3fbbd7aa2042a5f0a"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.22/tokenpylon_0.6.22_linux_arm64.tar.gz"
      sha256 "1f4ce12fca9049207f3f2f98e1383493087bc1cfa1731d5a1de04e967dfd459a"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.22/tokenpylon_0.6.22_linux_amd64.tar.gz"
      sha256 "d25d9c46abe47fa274a1740589dad4888d8fed4645b69dafe4e2d337f9b117b9"
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
