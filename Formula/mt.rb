class Mt < Formula
  desc "mt task graph CLI"
  homepage "https://git.7n.ai/metatask/mt-rust"
  version "0.4.2"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1ca43-e496-7801-ba5c-2e8f0af2baba/mt-aarch64-apple-darwin.tar.gz"
      sha256 "157f2d136438b8fc47470f98f2b2f9264a4f46159a06a503309ed469f823f569"
    else
      odie "mt: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/mt-release/01a1ca43-e496-7801-ba5c-2e8f0af2baba/mt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4dbd08e3a6749b451e0912458fd8decf8a0a52d08ff978a9fb22aacd604bb19e"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1ca43-e496-7801-ba5c-2e8f0af2baba/mt-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5c6b9c52f68a148a79adc17e294ab585c1db34d399e5d96b8d06242f77a19942"
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
