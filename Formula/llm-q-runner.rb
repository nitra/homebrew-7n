class LlmQRunner < Formula
  desc "llm-q runner"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.8.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a20c8a-e263-7380-a302-4e3e1a9da192/llm-q-runner-aarch64-apple-darwin.tar.gz"
      sha256 "0c1c9c53e306b1b4a7b5cbb0242f14f2fd28021bf1ae86cf83231c73de4121f8"
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
