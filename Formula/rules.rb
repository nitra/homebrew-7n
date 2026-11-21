class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.7.0"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1ff00-0c2f-7040-871f-10e126d39421/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "705dd426486b4175386e3b4a041fb9bee0e503cfabff02f0bf065c8f7a10f0fe"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a1ff00-0c2f-7040-871f-10e126d39421/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fd174c619dab0946c27e9b47007eebc2631c1066dafd87c2c67e9b44748bf8a7"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1ff00-0c2f-7040-871f-10e126d39421/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "524d8934bc1603fa809c6fd66052014e8172ea1dca117ed2e250d387ea2db93e"
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
