class G < Formula
  desc "g CLI — git-дельта інструмент @7n/n (скорочено від git; репо git.7n.ai/7n/g)"
  homepage "https://git.7n.ai/7n/g"
  version "0.1.2"
  license "ISC"

  # BEGIN_MACOS
  on_macos do
    if Hardware::CPU.arm?
      url "https://git.7n.ai/7n/g/releases/download/v0.1.2/g-aarch64-apple-darwin"
      sha256 "16f7239dcffb86b5a8d06bc139704e9bef887eef22da2c042142f04d660fddd1"

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
    odie "g: Linux build not yet published for this version"
  end
  # END_LINUX

  test do
    system "#{bin}/g", "--help"
  end
end
