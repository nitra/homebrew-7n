class LlmQRunner < Formula
  desc "llm-q runner"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.5.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcb0-8f56-7e82-a508-f232aefdc9c2/llm-q-runner-aarch64-apple-darwin.tar.gz"
      sha256 "23a68b571580133c14ce76c59b814fd5cba4e2cb63f1248e54516a5d408f4a19"
    else
      odie "llm-q-runner: Intel macOS is not supported"
    end
  end
  on_linux do
    odie "llm-q-runner: Linux is not supported"
  end
  def install
    bin.install "runner" => "llm-q-runner"
  end
  test do
    system "#{bin}/llm-q-runner", "--help"
  end
end
