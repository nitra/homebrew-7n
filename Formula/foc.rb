class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.15.0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "9d2dd7dd2631cbf06c24bae9ac5a236ababba4cd2905fcff38bc0013cfebccde"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.15.0/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da1a1ead0b6c7e899a9319b707c56d6d54c804e4ba581563f09b49565933e5c4"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.15.0/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "43c37745a6f1364208ce233faea54e2ab15186b6d5755fa8774cc7b868998d84"
    else
      odie "foc: this Linux architecture is not supported yet"
    end
  end

  def install
    bin.install "foc"
  end

  test do
    system "#{bin}/foc", "--help"
  end
end
