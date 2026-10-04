class Artifact < Formula
  desc "Artifact publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.11.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a1057f-36f1-7db0-9296-d5f89862ffec/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "a558951eee6bb522bc4c3cf8147a60658a66a5870b2c6cc3b4ec1a07cb002e10"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/artifact-release/01a1057f-36f1-7db0-9296-d5f89862ffec/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2673a37abfe77c1fd4889c70a40774aedb29bb85016669b8439356ba18452677"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a1057f-36f1-7db0-9296-d5f89862ffec/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0a8faee6a0b4bcab06315218f3e39a9636fc99e871ec38b924f33a84d46239dd"
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
