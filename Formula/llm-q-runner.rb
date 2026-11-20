class LlmQRunner < Formula
  desc "llm-q runner"
  homepage "https://git.7n.ai/7n/llm-q"
  version "0.4.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/llm-q-release/01a1f906-e9db-7872-8b63-11549ea2d0b8/llm-q-runner-aarch64-apple-darwin.tar.gz"
      sha256 "d63b8ee4533f16ac95eaf84f5847c43290a8bff4e2f1abe120dff849fd7d287e"
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
