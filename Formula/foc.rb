class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.20.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a17cbd-8d09-7a02-b26e-8c237f0950e0/foc-aarch64-apple-darwin.tar.gz"
      sha256 "014f8a0bab34dbceaebef4ff57648f1683f7cfac153e3645a1b4b897ce479210"
    else
      odie "foc: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a17cbd-8d09-7a02-b26e-8c237f0950e0/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6417554585d75386885e7b60c5fb6f5bf9ce427b6f3ff794942b23eb22d44394"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a17cbd-8d09-7a02-b26e-8c237f0950e0/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0d02673ed7614ff070475ca9f1fa0feda15ad4aeee92da814be81103e91ca1e"
    else
      odie "foc: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "foc" => "foc"
  end
  test do
    system "#{bin}/foc", "--help"
  end
end
