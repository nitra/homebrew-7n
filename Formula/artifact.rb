class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.2.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.2/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "6f0983a4bd564d198f6c1e5adffcc7ca28780d04322e2f80f8b7543ff5caa121"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.2/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a04411131fa76a449cbf7f36d89d4017c6a053db381a4fe55575cd6ef6074f2"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.2/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e56e433c881f01b2058746efa9cf958e22d3ef6f4c39c1a2a93c780b4c563310"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
