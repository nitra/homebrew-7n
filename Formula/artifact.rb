class Artifact < Formula
  desc "Artifact publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.11.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a0d7f4-c4e2-7561-9cc6-f91cc11557ce/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "2ce5ef621d8f28131adda3ebfab12ecaf466d96a16ed4f8200ad4535c988b3db"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/artifact-release/01a0d7f4-c4e2-7561-9cc6-f91cc11557ce/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "589ca782f327e4302607e90b471256600b137f1596a9cb5a0b57764009b01894"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a0d7f4-c4e2-7561-9cc6-f91cc11557ce/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ab8999a3f99a4f905bf0e35e3c26e3700feae90fed58fcde515a93b21f47db2e"
    else
      odie "artifact: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "artifact" => "artifact"
  end
  test do
    system "#{bin}/artifact", "--help"
  end
end
