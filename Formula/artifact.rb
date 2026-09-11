class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.7.4"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a08f14-f8f9-77e3-8fa9-9b02d7d1f3e7/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "69b5d131bcf4053178ccc77c55ceb5eb94eeb3bbbe7de344874137033aebef7b"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/artifact-release/01a08f14-f8f9-77e3-8fa9-9b02d7d1f3e7/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cb2b69268d505b338dbeb11d028734c6085802b546bd40b8e37dcbc10610aac9"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/artifact-release/01a08f14-f8f9-77e3-8fa9-9b02d7d1f3e7/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "878b47e236314e7196cebb9df673d623ff27bc9e70d26acae050c79a8b7ac4bd"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
