# Homebrew formula template. Lives in a tap (homebrew-tokenpylon); URLs and
# sha256 values are filled by scripts/release.sh from dist/checksums.txt.
class Tokenpylon < Formula
  desc "TokenPylon collector: LLM API call metadata, local usage page, shared price evidence"
  homepage "https://tokenpylon.com/docs"
  version "0.6.28"
  license :cannot_represent

  livecheck do
    url "https://github.com/AndrewFribush/tokenpylon-releases/releases/latest/download/latest.txt"
    regex(/(\d+\.\d+\.\d+)/)
  end

  on_macos do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.28/tokenpylon_0.6.28_darwin_arm64.tar.gz"
      sha256 "479564d007f3114f7a68b8a9eac2df8034188da75ee108c2771ccbc3ebddc576"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.28/tokenpylon_0.6.28_darwin_amd64.tar.gz"
      sha256 "6ef6856dc9adda7511c38fbbc60956ff7034fc761d89365410fbc5a3cba178e0"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.28/tokenpylon_0.6.28_linux_arm64.tar.gz"
      sha256 "413a6f8570ac00e02e54701aac22eadd1fa912d8c841cbb4756f5c170ae090be"
    end
    on_intel do
      url "https://github.com/AndrewFribush/tokenpylon-releases/releases/download/v0.6.28/tokenpylon_0.6.28_linux_amd64.tar.gz"
      sha256 "b2575a857b00211339a62c3d1bb50bea1bd71841aacf2b6f800760e4971727bf"
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
