class LlmQRunner < Formula
  desc "llm-q runner"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.2.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f431-cef9-7bd0-ba8d-ff3f392dfa26/llm-q-runner-aarch64-apple-darwin.tar.gz"
      sha256 "eec6970a1a18f544cf3895062c69776cfa4c90615e7c7718d33e7a49caf58ea6"
    else
      odie "llm-q-runner: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/llm-q-release/01a1f431-cef9-7bd0-ba8d-ff3f392dfa26/llm-q-runner-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cf19d62c04326c90a794a1524016550bb8e43d7732838333ba8c810487d49d2"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f431-cef9-7bd0-ba8d-ff3f392dfa26/llm-q-runner-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a38ceea8178e8c8898420d91313f1e11c346cc33c09d6292d60f003c8e771998"
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
