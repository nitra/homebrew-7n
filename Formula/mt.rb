class Mt < Formula
  desc "mt task graph CLI"
  homepage "https://git.7n.ai/metatask/mt-rust"
  version "0.3.0"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1c522-cb40-7622-a91c-7e880c3c691f/mt-aarch64-apple-darwin.tar.gz"
      sha256 "0977b55dcc8b3f09bb7739c8a36ee529ac786d66fe38daee468bae50a6438ad2"
    else
      odie "mt: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/mt-release/01a1c522-cb40-7622-a91c-7e880c3c691f/mt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6518ae123f609ca86244738f862a8f885150d27244e7656972331d7881c2f57b"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1c522-cb40-7622-a91c-7e880c3c691f/mt-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "659e582cf3eec3a59ab81851280213b19c5492ce84e97be732e3ee40e6953dbe"
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
