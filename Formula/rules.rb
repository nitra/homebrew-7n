class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.6.0"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1b799-43e6-7040-ae39-8a82afee812b/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "24ff61c60aa1591f472404d64fc0d06ac1d2cab8451761973f3ec9f219ae86e2"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a1b799-43e6-7040-ae39-8a82afee812b/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6aa2e9aab287a7de80d5bd596e89eeec59b35b091e5c60a21668bd32ffc99e86"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1b799-43e6-7040-ae39-8a82afee812b/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a7fa2d519258fbb530534d24b4684bae4d1b981e46109d988f28a9e14960a5d8"
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
