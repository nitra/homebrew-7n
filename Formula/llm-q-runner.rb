class LlmQRunner < Formula
  desc "llm-q runner"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.5.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1fcd0-9cee-7ae0-b063-a544d38a7c13/llm-q-runner-aarch64-apple-darwin.tar.gz"
      sha256 "f3b395974808597ef196b72c0c10614c61580dd655f5b93b4ca9166654a0c93e"
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
