class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.4.0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "45c0d4a7e8e9a1637bc14b54de7044e9caab65654e4393a06fc721f9e0d7a333"

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
