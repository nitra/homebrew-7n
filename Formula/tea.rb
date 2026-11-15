class Tea < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/tea"
  version "0.21.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a1e06a-b89c-77b1-bff8-ae307b4a10b8/tea-aarch64-apple-darwin.tar.gz"
      sha256 "55115ccb888f81f1c3d8042d66eab8afd5aebabe0c63c0be7ff12adae254700d"
    else
      odie "tea: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a1e06a-b89c-77b1-bff8-ae307b4a10b8/tea-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c43751d858be174ad81037e5979212f0f38ff75ca56396323affa45a546b38f0"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a1e06a-b89c-77b1-bff8-ae307b4a10b8/tea-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "16efeede640151fda0c9664a7b9852c40818d813c8d01e31cd9c6b92da891f52"
    else
      odie "tea: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "tea" => "tea"
  end
  test do
    system "#{bin}/tea", "--help"
  end
end
