class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.5.1"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1b07e-93e7-7211-9c07-c2bcd0f2bab1/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "8573a173dcc30ffd3214c0250d476e21bb233b2350cabaa5dcdf554419d5c594"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a1b07e-93e7-7211-9c07-c2bcd0f2bab1/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "15bafdfd5d315f5c0cd7b9056175f21ffd49d3871bd5fed8fc3d7a09e625ac56"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1b07e-93e7-7211-9c07-c2bcd0f2bab1/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "196e59a8ec4d0e8746732a8ecfff86c684cb669bec026edbcf91edb3d8e9da75"
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
