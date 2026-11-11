class Mt < Formula
  desc "mt task graph CLI"
  homepage "https://git.7n.ai/metatask/mt-rust"
  version "0.4.3"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1ca96-d7fe-7430-ac3a-aa70c2013052/mt-aarch64-apple-darwin.tar.gz"
      sha256 "3e03250a88f5df735efb34ad09d4b30b7adffb27385271fa54d877db3afa24c4"
    else
      odie "mt: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/mt-release/01a1ca96-d7fe-7430-ac3a-aa70c2013052/mt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "063c557290a8786aa60d4df314fd98f961a2683a303c243703a8cb2b6bb78239"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1ca96-d7fe-7430-ac3a-aa70c2013052/mt-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0d116589a6832c7ea7a6f6b7e904cf7bb72bf2b2a6f42cbe82f1b82a6547b78"
    else
      odie "mt: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "mt" => "mt"
  end
  test do
    system "#{bin}/mt", "--help"
  end
end
