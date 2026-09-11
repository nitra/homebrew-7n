class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.7.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a08f3b-65b5-7930-8b7e-4c53f904af15/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "07cf6bcb4d0b610cbfd1c9163a0308b91d2312d0a633c85fb1de68ba1b6511f7"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/artifact-release/01a08f3b-65b5-7930-8b7e-4c53f904af15/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b95ac39aad134e45132a0fb16504e60733dfdc053437ac7a970a160fa1468b33"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a08f3b-65b5-7930-8b7e-4c53f904af15/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f4fd9251630ffac84fd1e5ba25db377d1d86ebb68c0920d1e6f3b005032ece43"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
