class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.4.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.4.0/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "d354cfe1838c5d98e70e8a93f3ca00c2b325fec950a843deb5d3a69e442e42e7"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.4.0/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1f88997225079ea0b2a0ce96f00d1dc8524bf04f1908ec0ac60ce60da65c79cd"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.4.0/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "80486479f74fd27fa98410a4f6a6e573de08890fe86427da6af249c239c31b75"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
