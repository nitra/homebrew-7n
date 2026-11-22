class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.6.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a2025d-1fe0-7dd1-8d9a-63f2ae373f0f/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "c5d83cd862f5d2c1c94aba5c8cd788978fd9beb2b0fa9691cf0134a29eca7173"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a2025d-1fe0-7dd1-8d9a-63f2ae373f0f/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d9e9f5b8a3f53d5b8f0bc2f31731c4e6ece5afbbbdb4d8e0b9a1037579ad7cda"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a2025d-1fe0-7dd1-8d9a-63f2ae373f0f/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bb0cafef0d1a9d8101f86401167f24524966080476dd864043244343de48eaf3"
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
