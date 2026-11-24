class Tea < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/tea"
  version "0.22.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a20c82-5e2b-7ed1-8225-1378001bcd4e/tea-aarch64-apple-darwin.tar.gz"
      sha256 "c34c87f6bfe75f635a32ab14d988784caeb68f9427f9e09eadd40921d04d6031"
    else
      odie "tea: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a20c82-5e2b-7ed1-8225-1378001bcd4e/tea-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21676be89837d201a4861d48c6b7ea6b2fd50360e9f15e43372292811e30f74b"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a20c82-5e2b-7ed1-8225-1378001bcd4e/tea-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa90410881f789e35d7a498aec3d6cdee388670a9f30b74bcdc219250e8da80d"
    else
      odie "tea: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "tea" => "tea"
  end
  test do
    system "#{bin}/tea", "--help"
  end
end
