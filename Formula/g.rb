class g < Formula
  desc "g CLI - git delta tool"
  homepage "https://git.7n.ai/7n/g"
  version "0.2.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/g-release/01a0bd41-8753-75d1-b192-27ee868e57d9/g-aarch64-apple-darwin.tar.gz"
      sha256 "832daf17b92c11df8db17ab38eb60830fe3a7404145f62ddba57a106e19ce0a5"
    else
      odie "g: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/g-release/01a0bd41-8753-75d1-b192-27ee868e57d9/g-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5ff5266970e580b941f713717fa1d57918f3f31b2cf9f067e14afb2fa826a8fa"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/g-release/01a0bd41-8753-75d1-b192-27ee868e57d9/g-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8ea4c12d22b40626070f737180398f590dc4ce525101a56ff1e8e5d03a480b7f"
    else
      odie "g: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "g"
  end
  test do
    system "#{bin}/g", "--help"
  end
end
