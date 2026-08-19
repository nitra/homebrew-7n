class G < Formula
  desc "g CLI — git-дельта інструмент @7n/n (скорочено від git; репо git.7n.ai/7n/g)"
  homepage "https://git.7n.ai/7n/g"
  version "0.1.4"
  license "ISC"

  # BEGIN_MACOS
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nitra-public/7n-g/releases/download/v0.1.4/g-aarch64-apple-darwin"
      sha256 "43a52e79285e38cb3c666ad2a1a2883c59ce8a32c2f488527ca97ccdde984283"

      def install
        bin.install "g-aarch64-apple-darwin" => "g"
      end
    else
      odie "g: x86_64 macOS ще не підтримується (немає x86_64-apple-darwin ассету)"
    end
  end
  # END_MACOS

  # BEGIN_LINUX
  on_linux do
    url "https://github.com/nitra-public/7n-g/releases/download/v0.1.4/g-x86_64-unknown-linux-musl"
    sha256 "c163bc2f08ce1114d8cf77b4ad5cd5ed35df325c6814e2c88264f77698a21593"

    def install
      bin.install "g-x86_64-unknown-linux-musl" => "g"
    end
  end
  # END_LINUX

  test do
    system "#{bin}/g", "--help"
  end
end
