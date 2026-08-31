class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.2.0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "8f03ec642cb36b90b5e5f9bc2ad2ce985b81b48bb8d9b4eb9a8a5a4a0670baf2"

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
