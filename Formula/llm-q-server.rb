class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.5.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcb0-8f56-7e82-a508-f232aefdc9c2/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "b28b32a60b2ac7fca65ce525622a790b158c6387830890be5846f4c4c4fad2ec"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcb0-8f56-7e82-a508-f232aefdc9c2/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "292801b2a312ba4cd6d91751dec138880e6bc2051f0c733d773a745220ad2cdd"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcb0-8f56-7e82-a508-f232aefdc9c2/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a2b63d6a13d2c25f7af342d50b144ad116f6c47aa5dbe615328bf9ec075e6e43"
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
