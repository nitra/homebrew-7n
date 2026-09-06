class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.2.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.4/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "e818628415b40f5f5466c2839d1be1e33560a18de15cc448c6a8c1ce0e346d0d"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.4/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e3e88615cf0594644c5d24c6eb9cb9856528410233aab869fb58765756783cb"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.4/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a31035300ff8058d9ce6eb95a8c2acb69b027c4e687537a43322bbbcee20113d"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
