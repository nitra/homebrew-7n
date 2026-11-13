class Workforce < Formula
  desc "Коментарі між вузлами Metatask для людей і агентів"
  homepage "https://git.7n.ai/metatask/workforce"
  version "0.4.0"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1d3b7-5e91-71b2-9728-441fef3250a6/workforce-aarch64-apple-darwin.tar.gz"
      sha256 "85461c394abf0c0d97e9aaa1b53a5fb2b2838f6bbbd66cff593edfd1566921e0"
    else
      odie "workforce: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/workforce-release/01a1d3b7-5e91-71b2-9728-441fef3250a6/workforce-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d61ac19dc2f0fc6ce309eaa9a3c3d3aabf400d7ee174a48fa07c8fa0ee48d66a"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1d3b7-5e91-71b2-9728-441fef3250a6/workforce-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "98fd9ff6e2eaaca4c3bd98f7b2665f455ddacb127429ac1b87a490c77dbd15ae"
    else
      odie "workforce: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "workforce" => "workforce"
  end
  test do
    system "#{bin}/workforce", "--help"
  end
end
