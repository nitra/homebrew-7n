class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.1.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f38f-c315-7142-88a4-61d1d19d7cbe/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "bd4c2d84561c2d33b2eee3b09a2d3f41b4c68c5fbecfbd34017a695a9d5a3d3a"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1f38f-c315-7142-88a4-61d1d19d7cbe/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5967b2841b09069b972a8be79520a3ae90540705ee54706a90ba5ff98f0b31f"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f38f-c315-7142-88a4-61d1d19d7cbe/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ffb1a7a63a05113ce9d1722abcc226e0bedd090063742f848f5b997a350f4660"
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
