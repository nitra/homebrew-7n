class Artifact < Formula
  desc "Artifact publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.12.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a21c6f-6cb2-7cb3-8996-cb431fa67095/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "8b51bc063fc13d552f4791d3862781d8939092e54bae6fae51b8d7d8091df4d8"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/artifact-release/01a21c6f-6cb2-7cb3-8996-cb431fa67095/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d37941cd4e828cdb54674878120da560bb4db6adeed89e84a2c6dbbd712b131"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a21c6f-6cb2-7cb3-8996-cb431fa67095/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f42561afa6af449b364da3ef3298a0318ffde136257faff7291e5806467a731d"
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
