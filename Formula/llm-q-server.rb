class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.8.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a20c8a-e263-7380-a302-4e3e1a9da192/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "962b81e78d5d83f6bf2e6db009b69d7031c70b28f5fbb26bf74e27856513e785"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a20c8a-e263-7380-a302-4e3e1a9da192/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d35235d1219a5e3516878a92533522d01e85f24c0a1fbc5a33e65fbf19708240"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a20c8a-e263-7380-a302-4e3e1a9da192/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0541562577437585fa5e9f2317fe0096fe207fe6c847f4eaf4a4d3bdddf6259"
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
