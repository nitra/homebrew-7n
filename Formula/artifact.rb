class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.3.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.0/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "5a2b7d722e0676d1ef0e9f81957df32612c80b6d109f11893fb8a392257a0560"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.0/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "757d51a9c0a56ad84ef070c421f5e5c199ed58b4d349663e87099594698a3ca2"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.0/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "317722b9f0b395d5be8aca27d724bafe3a01a10585d834dbd11c413b90a8ca77"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
