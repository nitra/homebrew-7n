class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.3.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.2/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "a8d3b8cd0284a3a59625d4f039788e859271afb9dd8b23d83696646ac87fc93c"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.2/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0e23fb6e4d0a0f36be067fb7f427a971dae5dad28eef1c95b94d856e63b6fb2c"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.2/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f34d1859062537df8643a4f76b5455e8eaa5e29ed3b7bde5b6b2d8daa25983ea"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
