class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.1.8"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://git.7n.ai/nitra/foc/releases/download/v0.1.8/foc-aarch64-apple-darwin.tar.gz"
      sha256 "4bdf88d17833f4c5c458b114a6960f40768168a7418fb43f065639203c1ef3e4"

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
