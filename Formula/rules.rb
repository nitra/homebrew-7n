class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.3.0"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a153b3-6361-7d62-a418-66941a6d3e7b/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "df3cf67d9413f20d993253030da4eb0ce9c27c5a5672c404c7c8b338e4b10f03"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a153b3-6361-7d62-a418-66941a6d3e7b/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2aa0f2cc1db354411066734600a3eb403370a89558e19b52b325191a4edfff1"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a153b3-6361-7d62-a418-66941a6d3e7b/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "111b59c0237dae52f572107653ba5aaa83859b84d9ce73adf2baf7b39ca88b20"
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
