class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.13.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.13.1/foc-aarch64-apple-darwin.tar.gz"
      sha256 "683b14a14ad0945bf85ca0853cc60dd6d9474abfa34194c9f31638b640fa677c"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.13.1/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0b11053dd4b469692b0bbb0aec86b9f4720dfcbedf750cf48164bad291135661"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.13.1/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5b515620421f7e2d7667afd193f7e570827a62212ff28c4c0872506eb06ae8b3"
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
