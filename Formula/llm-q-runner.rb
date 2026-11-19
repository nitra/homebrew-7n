class LlmQRunner < Formula
  desc "llm-q runner"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.1.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f38f-c315-7142-88a4-61d1d19d7cbe/llm-q-runner-aarch64-apple-darwin.tar.gz"
      sha256 "2ea435c26221a04543f184e2c39c818ce818d1e3cdcba4b904d78724d2deb648"
    else
      odie "llm-q-runner: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1f38f-c315-7142-88a4-61d1d19d7cbe/llm-q-runner-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06fb441afe717a397b8e827eec5a003cb2ad9d32a0cb505e47e45aa61f2708ae"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f38f-c315-7142-88a4-61d1d19d7cbe/llm-q-runner-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b04d61e3ec1b4552b8a70aae5353f29f9ee86f577a3578617da51967e4d103c9"
    else
      odie "llm-q-runner: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "runner" => "llm-q-runner"
  end
  test do
    system "#{bin}/llm-q-runner", "--help"
  end
end
