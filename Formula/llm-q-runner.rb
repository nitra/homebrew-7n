class LlmQRunner < Formula
  desc "llm-q runner"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.6.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a2025d-1fe0-7dd1-8d9a-63f2ae373f0f/llm-q-runner-aarch64-apple-darwin.tar.gz"
      sha256 "2d7dcd0f93a4c73df9d265b3a8d30a46666e20986a8482d119402119cf3ee1e9"
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
