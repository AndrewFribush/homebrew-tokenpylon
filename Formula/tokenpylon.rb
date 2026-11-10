# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.34"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.34/tokenpylon_0.6.34_darwin_arm64.tar.gz"
      sha256 "6c1d89433ac78dde8bad7787bfcb7b4a08f0543759d0e6262ed3ef50f810ea28"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.34/tokenpylon_0.6.34_darwin_amd64.tar.gz"
      sha256 "97e5f391b032d32874410ce8cf1010855ee01180e8b06918dd0f98221b80129d"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.34/tokenpylon_0.6.34_linux_arm64.tar.gz"
      sha256 "41dc0cbc4c8db8e841644518f6dddabbfe52c411ee194f48071037e6b6cb8bfb"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.34/tokenpylon_0.6.34_linux_amd64.tar.gz"
      sha256 "4a63314a3744ec9670fcca40a88f436f169da347006fcb8518fd5a05c452ac52"
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
