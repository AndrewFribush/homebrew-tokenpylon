# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.32"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.32/tokenpylon_0.6.32_darwin_arm64.tar.gz"
      sha256 "aec79eb69d15c719109feed5addc6ff253adb4288d26468aad8a2c7d25d81d61"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.32/tokenpylon_0.6.32_darwin_amd64.tar.gz"
      sha256 "d73186e52b522bf202ca689d877d113a77a093bbe714b96e597b778b673b6fa6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.32/tokenpylon_0.6.32_linux_arm64.tar.gz"
      sha256 "51435df8471045e52c455612d9497d262ffcc5535c82a938826d1e1ac56051c4"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.32/tokenpylon_0.6.32_linux_amd64.tar.gz"
      sha256 "e3fabba8f245e22729cf06fcf06234649ab4c2ab4405e3256ccfd7aa48ce9219"
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
