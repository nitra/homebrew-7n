class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.5.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcd0-9cee-7ae0-b063-a544d38a7c13/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "57d89d70b2d9e7eed4891228c4aad6a47d72d1624a7bc8f217fc5e3ad655133b"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcd0-9cee-7ae0-b063-a544d38a7c13/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "da749725e9c8382c6a7c20413463c018d4609a5dc6cb861f958c0f329c5881d8"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcd0-9cee-7ae0-b063-a544d38a7c13/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dd45aa11c2c041b14d4979a8acc163de5ffbc8b315588afc9d652a3c9b3fabb6"
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
