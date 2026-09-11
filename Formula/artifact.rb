class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.7.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a08f0f-6389-7353-b3dd-b5cff44d2381/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "69b5d131bcf4053178ccc77c55ceb5eb94eeb3bbbe7de344874137033aebef7b"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
        url "https://7n.ai/artifacts/artifact-release/01a08f0f-6389-7353-b3dd-b5cff44d2381/artifact-x86_64-unknown-linux-gnu.tar.gz"
        sha256 "cdc4958b38296ea05905e44434e6dc5f182bbcb5b539589c86b3b7740fa4d495"
    elsif Hardware::CPU.arm?
        url "https://7n.ai/artifacts/artifact-release/01a08f0f-6389-7353-b3dd-b5cff44d2381/artifact-aarch64-unknown-linux-gnu.tar.gz"
        sha256 "27b561b01ff823ded48b0d35f5bdf8613b09541e1f065591b88d5e9b19bcf903"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
