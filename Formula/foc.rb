class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.13.0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "72ba6cd79b938fef30a7ac376284fdd486e0d0a8afbfaaeb7fab584e0bc994d9"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.13.0/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d778add957488469f5b5359720acc14ad7ce5e88b1b0e42f6100cd8e8a2b7d7a"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.13.0/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b1faeb46ddf8ea19f52bb54b61e6d70bee37fdabffab7a4a270642e07298f58f"
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
