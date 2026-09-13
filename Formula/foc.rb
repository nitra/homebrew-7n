class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.17.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a09ad1-9108-7850-86d6-7ee1429f955d/foc-aarch64-apple-darwin.tar.gz"
      sha256 "6708f6233ed8ae4d36ecdd1506497d136249202c1165b362212d778f3be281dc"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a09ad1-9108-7850-86d6-7ee1429f955d/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf444943d3f5e717288c3d0dbb28feb624722b941b208ab68937bc39f5b31267"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a09ad1-9108-7850-86d6-7ee1429f955d/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ef7848090de9821a51ad269d6f3c0d392c345be9e789ccbfbf71423d699654d"
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
