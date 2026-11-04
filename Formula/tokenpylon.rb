# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.30"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.30/tokenpylon_0.6.30_darwin_arm64.tar.gz"
      sha256 "f2d275812ec8331aebe6dc9d9931b63af7bafc3de87447d3dc5cf2dd976e6242"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.30/tokenpylon_0.6.30_darwin_amd64.tar.gz"
      sha256 "cfd5a9ffeaf397d3c0fcde7382a853936dbfcb8f92010e8be66f4b0e40228bfe"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.30/tokenpylon_0.6.30_linux_arm64.tar.gz"
      sha256 "d0ca3cbe73a5626ed483aac930ba9134f23f7b55845a6b34be3b45361e3b7058"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.30/tokenpylon_0.6.30_linux_amd64.tar.gz"
      sha256 "9c7989dfbc35a124b54dc84cb86b6be22611d22a2634367771320c0be411bed4"
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
