class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.5.0"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1a778-c8fa-7c20-b859-23dcb90594de/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "249c53524fbea30e4523a9aa9d7bb01bd2f91486287c24e2f835b1fa5faf7240"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a1a778-c8fa-7c20-b859-23dcb90594de/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "914894968734c40d418adcccaf7b60ff5e0e27458d105b8d1fb5c7eb9f97bd56"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1a778-c8fa-7c20-b859-23dcb90594de/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc6e0e0094fe03ee825d049937aa59634a58c3b18061c72636e6d5a8b44e7848"
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
