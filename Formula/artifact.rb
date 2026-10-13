class Artifact < Formula
  desc "Artifact publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.11.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a134e7-8a64-7c62-beab-6b99af875c87/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "072ed9bec6e525670514e103866092b6c718a8513074d2306eff78fcd6f8e00d"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/artifact-release/01a134e7-8a64-7c62-beab-6b99af875c87/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82b66a6424f47b7918a2af1f98e245c1f12c32ade3ddd874bb15faaad5262fb6"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a134e7-8a64-7c62-beab-6b99af875c87/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3b0cbb14fc348ecfe255b4d31216e0adfeeaedc16aca24c81f1ec3625a39bef7"
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
