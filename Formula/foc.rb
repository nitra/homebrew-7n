class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.14.0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "325d67d658a362e91040321671122082f92bab986cc99b781eb0cb6c9ed0244c"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.14.0/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47f6816794cade5a0e8d9998d300358adf543f303c9f2f552d4050c132143260"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/foc/0.14.0/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6036ef6a97db1f652e0a37534c8877b491ed719d2c4c62b0fa5ad6f6cbebef9"
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
