class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.9.1"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a21831-62a1-7100-a92a-6fda77207e41/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ad6d6a201ef74ef019b96ca195fd40fec458978673254f8c642f140b34d28146"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a21831-62a1-7100-a92a-6fda77207e41/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82bd5ada2569b22057aa14857ea2149d10b026ee9d97d705359c7e0b23de522c"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a21831-62a1-7100-a92a-6fda77207e41/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4a9fef3c641e9a921d6a8c1f7a520d4bc70b80cbdbf710faadcde4135fed4cf7"
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
