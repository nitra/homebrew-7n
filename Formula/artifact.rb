class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.1.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.1.0/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "457cb5c89ca79bddcee27699f260e56f84645b1f01393f61db9ccd142dcd32bf"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.1.0/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bc6ed8f9574dc8a20ca36f20cae4cf85c48619898162d08aa235da0263043e65"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.1.0/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c52765e9c6bc7e116b82137fabc7672fabcc48e899aff6873d786b8ebf92d9e9"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
