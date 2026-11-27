class Tea < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/tea"
  version "0.23.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/tea-release/darwin-arm64/01a21cd3-13a0-7160-838d-64db1d777888/tea-aarch64-apple-darwin.tar.gz"
      sha256 "71e3ae3c0fb72cbde9ba78e85727dac099a3b869fa843e2372884bacd39c207d"
    else
      odie "tea: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/tea-release/linux-x86-64/01a21cf8-6ae3-72b0-adac-f35502f1eda5/tea-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "92c13dab7c8fb07f6ef9730f4bdaa6a015d3379f9fc698e42db010e76124f963"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/tea-release/linux-arm64/01a21cd5-f24b-7423-b7b6-722a1671c9ba/tea-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93e95e15eb2a8a0f94852d4af982cc77f9192428e286aa38b1eba03252916ce1"
    else
      odie "tea: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "tea" => "tea"
  end
  test do
    system "#{bin}/tea", "--help"
  end
end
