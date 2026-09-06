class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.2.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.3/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "73393dcaf0cadcdc3809c56e1dfbe97a7f38d866e9c38c55d3bede1bd971bada"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.3/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bbb16f529a6ad3704ae315f7b1e42f4805ae116e2f2964799dbe600688100c9d"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.2.3/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "178d3fd2ca9b08c4b95f1be9ad8591586edeecb10eb680b40721a09d0e1c2575"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
