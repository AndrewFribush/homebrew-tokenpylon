# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.25"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.25/tokenpylon_0.6.25_darwin_arm64.tar.gz"
      sha256 "6a7b5700e34469c2a6648aa8e506b80f7aec9eab28d4ce1e2bf33871999e9248"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.25/tokenpylon_0.6.25_darwin_amd64.tar.gz"
      sha256 "eb9c465060b8ad3de24a19183dfa60aac282fdce6cb9e4fba3d5e68166f502c6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.25/tokenpylon_0.6.25_linux_arm64.tar.gz"
      sha256 "22014ffee32d79d971899e9ef968ef3333849a340d6b3ee96a53a891256ec9fc"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.25/tokenpylon_0.6.25_linux_amd64.tar.gz"
      sha256 "afa4de8ec9b6a3c6895a0dc698efe3d42ba7ac96a125ccbf68b6f3b0e3465ac3"
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
