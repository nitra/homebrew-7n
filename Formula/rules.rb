class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.9.2"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a21d14-ee5d-7642-9e10-2cfd47fc8cd0/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "23c09b7e58f86014abe4dc40bc833f7cd2a54bbcfa3ff2ac5de8c2a282b9d9ac"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a21d14-ee5d-7642-9e10-2cfd47fc8cd0/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "00f842c3cd82d16d9b04d60011c01a29f13175c8aa0ae7262460f0ffd650821e"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a21d14-ee5d-7642-9e10-2cfd47fc8cd0/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7c18978f20e54e20bc1523981b6049b9789880c55b93eda2b785aaf2712a2bcf"
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
