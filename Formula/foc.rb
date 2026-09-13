class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a09b0e-747a-79b3-bcf6-029aa5ebfc95/foc-aarch64-apple-darwin.tar.gz"
      sha256 "29d1a26abd893b7d7330b46c3562aecf56f54a4ec9ba491509f3ad9e66c09f8a"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a09b0e-747a-79b3-bcf6-029aa5ebfc95/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ef5fb3cd6a82bfe6ee52bd0d204cd56dd15a792035014382ff82f560752eb49"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a09b0e-747a-79b3-bcf6-029aa5ebfc95/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "019d5870dd8d0550c3b2f89ec41f0e1d2186ec1162a8ddb14bf01393c2a2e55d"
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
