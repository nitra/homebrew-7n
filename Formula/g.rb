class G < Formula
  desc "g CLI — git-дельта інструмент @7n/n (скорочено від git; репо git.7n.ai/7n/g)"
  homepage "https://git.7n.ai/7n/g"
  version "0.1.4"
  license "ISC"

  # BEGIN_MACOS
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nitra-public/7n-g/releases/download/v0.1.4/g-aarch64-apple-darwin"
      sha256 "fecb4464546c35d8c3b27a24b863d6f02511ddef5cf3b6bf627667ab89cda91b"

      def install
        bin.install "g-aarch64-apple-darwin" => "g"
      end
    else
      url "https://github.com/nitra-public/7n-g/releases/download/v0.1.4/g-x86_64-apple-darwin"
      sha256 "d4680edd9aa5260c013fdb608c3d73be5bb941c48f3c554ff981bef70a111256"

      def install
        bin.install "g-x86_64-apple-darwin" => "g"
      end
    end
  end
  # END_MACOS

  # BEGIN_LINUX
  on_linux do
    url "https://github.com/nitra-public/7n-g/releases/download/v0.1.4/g-x86_64-unknown-linux-musl"
    sha256 "a30932935d303b4496f007104069405f3d1d9ea07d3dabed124abf01c68f82fb"

    def install
      bin.install "g-x86_64-unknown-linux-musl" => "g"
    end
  end
  # END_LINUX

  test do
    system "#{bin}/g", "--help"
  end
end
