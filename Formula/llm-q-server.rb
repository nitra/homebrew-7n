class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.3.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f819-a263-70c3-bd8e-41c29a60523a/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "f7093c2d13574822d4bae90221329c427f195d80d19cb88d99e3755f2d0a7dcc"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1f819-a263-70c3-bd8e-41c29a60523a/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a3c74b7b1396e6e2ac25f3ad8811e9eeb3ad3653f8904f068d4340e98391f4ad"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f819-a263-70c3-bd8e-41c29a60523a/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0ea74c01495b69fbf155cea7bf7cb79258a70e7a5a9acedae7b3429a9349e672"
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
