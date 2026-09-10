class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.16.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.16.3/foc-aarch64-apple-darwin.tar.gz"
      sha256 "a0a7fffeb5981a28d3c1d3e4f1656a2509b28c3813080f1ea9378624b0e07b50"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.16.3/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "418fb801b7671c74b1393ba93615b74ebf54d4cd4b62ba91a2cd629fae432cb2"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.16.3/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5fa0560f66c5248abc3435170405af478d9bbb1b04569068ab615bd46831832c"
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
