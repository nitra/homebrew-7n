class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.4.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f906-e9db-7872-8b63-11549ea2d0b8/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "7b63eb039918839d5baa911f3dd45f9b271418b95520d53c6fe25ea8aa2fa7dc"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1f906-e9db-7872-8b63-11549ea2d0b8/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ce38580535b1d51c294599c6d3263a4e85f842784b21d05b71ddf0a5c4a34ab"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f906-e9db-7872-8b63-11549ea2d0b8/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a9278b1222d63b12708107d6ddc4fc645c350923d4a0a928f121fecdb2ec4f52"
    else
      odie "llm-q-server: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "server" => "llm-q-server"
  end
  test do
    system "#{bin}/llm-q-server", "--help"
  end
end
