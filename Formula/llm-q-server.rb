class LlmQServer < Formula
  desc "llm-q server"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.7.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a207d6-41f3-7992-85fc-dee50a008dba/llm-q-server-aarch64-apple-darwin.tar.gz"
      sha256 "f2e9483abf2f2b36a9f18cd85a605f476a6ed6ef0dbbb9e885296cf2588a845d"
    else
      odie "llm-q-server: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a207d6-41f3-7992-85fc-dee50a008dba/llm-q-server-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6d64cbbe9f27f12634bb319b9521498b55445e11215e358b61013da6d8eecf2b"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a207d6-41f3-7992-85fc-dee50a008dba/llm-q-server-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3827b16b81a56d29392be4faeaae38d88953260b3536e55bc3fb721ffdb4e883"
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
