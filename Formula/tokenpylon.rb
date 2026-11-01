# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.27"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.27/tokenpylon_0.6.27_darwin_arm64.tar.gz"
      sha256 "5dfe54da2c73f03f930f607ee8c5cad2bfc1fe35e83ddb58575ff11371b832cd"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.27/tokenpylon_0.6.27_darwin_amd64.tar.gz"
      sha256 "c14b8c0ddd6c426e8058eb1c6b21cdeaa4260d38710c0e44b3cef7ea32675e22"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.27/tokenpylon_0.6.27_linux_arm64.tar.gz"
      sha256 "a8a8e80d9fbf9e618ac86eb77bc6c17015a1c70242eb3191d34e68dff7b6c7a3"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.27/tokenpylon_0.6.27_linux_amd64.tar.gz"
      sha256 "4bfbab792a189f5c40fe5cf5f5d25f6f7153b2c53bcd26be7dd2e854c5583cb2"
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
