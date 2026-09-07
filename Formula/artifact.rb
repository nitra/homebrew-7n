class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.3.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.1/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "068514db8d88a12497337b3937a29a0016440854544573d215915e1e628de68f"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.1/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9537e711d454fa02e9781020d4424d097d8b0991a79220fe916e0c03742be51"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.1/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8841d23575d7d73668e4418fb83581737332d34049272f99e62074d616e961bd"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
