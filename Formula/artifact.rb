class Artifact < Formula
  desc "Artifact publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.8.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a09078-752a-7691-9eb9-7ad8fbdeef98/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "313c5e5a12d58ea640982be00a9bb15d74015a196f1e442800049f2c39d1a74f"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/artifact-release/01a09078-752a-7691-9eb9-7ad8fbdeef98/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d33f35feccc1ee966229ce77ffcd1487928d1247b6886de45cb03529454db0fb"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a09078-752a-7691-9eb9-7ad8fbdeef98/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "736119c8da15e0010cf01d26999def0e325a6ad22dc3b045eded9271e6f81ae7"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
