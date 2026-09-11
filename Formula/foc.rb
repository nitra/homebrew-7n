class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a08f31-64ed-7033-9569-b25670fc2330/foc-aarch64-apple-darwin.tar.gz"
      sha256 "b733ae97393d6571621882f755fc095462d54045587258341acc291883de16e5"
    else
      odie "foc: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a08f31-64ed-7033-9569-b25670fc2330/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b36ddbe31856a3e950c316303f52c2643d60e54a4bcdbcb3975a6523bdbf7a6a"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a08f31-64ed-7033-9569-b25670fc2330/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa08cb9ffc2d781f8753f2be0abe260baeb4574cf3780b9341fe438f0aebe82b"
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
