class Tea < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/tea"
  version "0.21.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a1da1a-8079-7d91-adc9-18276200e13a/tea-aarch64-apple-darwin.tar.gz"
      sha256 "6e3c0072fb2342a45fa3b24bd96b23ba6522026cf1681a34f66602dad646bd77"
    else
      odie "tea: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a1da1a-8079-7d91-adc9-18276200e13a/tea-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "de995f84c0a3a1f60ad0420267a27813951d96e6305f9cc2144f1a2b40feb763"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a1da1a-8079-7d91-adc9-18276200e13a/tea-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d38975113ff51dba06032f434766d074a36576ee40b2ca62d6b35a503316bee5"
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
