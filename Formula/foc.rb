class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.5.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.5.1/foc-aarch64-apple-darwin.tar.gz"
      sha256 "0300739cf0d248c224987edf46364efeb84476eeaabaf92b899c53ffa06dbdac"

      def install
        bin.install "foc"
      end
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  test do
    system "#{bin}/foc", "--help"
  end
end
