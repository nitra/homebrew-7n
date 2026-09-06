class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.2.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.0/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "9fa5a55edd3fbe722d720f88a509b8d6166af8e067a3a2b5b7f36a89d6075849"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.0/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be5ad105f101c0a56331c4e472158a4bd5153fb462a9d4ec236bd12e28f2ae93"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.0/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6901d7e37df5d5b2584026f88c02548e39c1a4e44ef139646cd0ae64d374a852"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
