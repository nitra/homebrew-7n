class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.2.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f431-cef9-7bd0-ba8d-ff3f392dfa26/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "7b0c2886e63b46d34a9a4e1802b0ac130b5943a234e0ab990190f8d5391e186f"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1f431-cef9-7bd0-ba8d-ff3f392dfa26/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1863aceb87e717cf0376e90699b01b428851982920ff846c21a711de13246bd7"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f431-cef9-7bd0-ba8d-ff3f392dfa26/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "77ee33593695c9c0ad7228470198c1c8bf2a3e2fc6fbdcdca7f349930bd31907"
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
