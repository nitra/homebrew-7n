class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.18.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a0ae12-63d6-7563-be3c-145cb2e14dca/foc-aarch64-apple-darwin.tar.gz"
      sha256 "12bdc8f9907f3e129a2b0f619383910b3edbfd974b7c80e62b626f918a2ef2ab"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a0ae12-63d6-7563-be3c-145cb2e14dca/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6cb799673267555002872171a2663a9913684c8c6aabceae34126b20b7dd792"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a0ae12-63d6-7563-be3c-145cb2e14dca/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b56a119cbc970127c3cf30fad3e1db16008b1eb26c5cc84660fd6597f660f4d3"
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
