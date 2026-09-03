class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.3.0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "38b6d974e7c205e1ede551bd06ae1638b03cb64f873866c62ab53e9f243e0c4a"

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
