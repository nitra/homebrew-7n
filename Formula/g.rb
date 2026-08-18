class G < Formula
  desc "g CLI — git-дельта інструмент @7n/n (скорочено від git; репо git.7n.ai/7n/g)"
  homepage "https://git.7n.ai/7n/g"
  version "0.1.3"
  license "ISC"

  # BEGIN_MACOS
  on_macos do
    if Hardware::CPU.arm?
      url "https://git.7n.ai/7n/g/releases/download/v0.1.3/g-aarch64-apple-darwin"
      sha256 "e37c598dac03bf02639c96d90fdb6d98f0cd34e81395228dd6f303cc2c40e4f5"

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
    url "https://git.7n.ai/7n/g/releases/download/v0.1.2/g-x86_64-unknown-linux-musl"
    sha256 "a94484fa30ab8433ab8fb106137bb6630beff0331f575c8980443195a38f6168"

    def install
      bin.install "g-x86_64-unknown-linux-musl" => "g"
    end
  end
  # END_LINUX

  test do
    system "#{bin}/g", "--help"
  end
end
