class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.7.0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "9c20e9b1c46775a7cc4abe7cc332dce00f18db2ef8c06ba83becc69f29bf5e35"

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
