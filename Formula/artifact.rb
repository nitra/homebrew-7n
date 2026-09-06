class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.2.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.1/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "7ffef13f5d1886f5a8d5e6f824d51d327301343bfef3a5d0c39b4848ab3184cc"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.1/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8cf4686f4b6acf21e8a0a115044ddd448d54e004960091aea8b4f27b18eef3e6"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.1/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "440f19609a7f28c625476fe01a0d1ab4bcaf56cb820584ec3eccc06139d46cb0"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
