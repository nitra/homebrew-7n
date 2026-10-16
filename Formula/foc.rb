class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.19.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a144a3-2b05-7592-b8d2-2dbab9c01c38/foc-aarch64-apple-darwin.tar.gz"
      sha256 "f4bfee743a15674b58d4e6a6cd2dd75687cb55243d762da5b75f16f4b0819cbc"
    else
      odie "foc: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a144a3-2b05-7592-b8d2-2dbab9c01c38/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a573e93896fd5048bd8c9961cdb373c77384b2d41b1834abf64c5cef8af51c64"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a144a3-2b05-7592-b8d2-2dbab9c01c38/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9519f8f7be0bce95a5b30b2aec2444d3a6a407c7f2c8388aeafbe93547141e2"
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
