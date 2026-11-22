class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.7.1"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a20249-10cb-7dd3-9074-80a4f4faa9db/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "607b9d6994c9bacde501b35e269803a53d2cc92b74c99517336331fd9f812260"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a20249-10cb-7dd3-9074-80a4f4faa9db/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "53a39d7cb9f6787ef25dc39c87e81a5bda05bb3ae82978b4761fe5abb75f004c"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a20249-10cb-7dd3-9074-80a4f4faa9db/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f50d2030d1c5b796c6cd18e4d8c72522343c7e8943386cd0e74559c24cc9457a"
    else
      odie "rules: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "rules-cli" => "rules"
  end
  test do
    system "#{bin}/rules", "--help"
  end
end
