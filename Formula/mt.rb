class Mt < Formula
  desc "mt task graph CLI"
  homepage "https://git.7n.ai/metatask/mt-rust"
  version "0.1.47"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a0bfad-8837-7df2-8080-3b2359623491/mt-aarch64-apple-darwin.tar.gz"
      sha256 "a44c6349eff209f8b2da5d581f9d1580739de9a7225a7e8edf0a678e12ac6785"
    else
      odie "mt: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/mt-release/01a0bfad-8837-7df2-8080-3b2359623491/mt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fbaa9989d1490430a07cab7527a4836f5fc29f7761fb13d2e76bb7d63fa3b40a"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a0bfad-8837-7df2-8080-3b2359623491/mt-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9b8b2f4f5c99e949d6a60cf053ab9dda413ec78fe788ec6076e7ba3879d37d07"
    else
      odie "mt: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "mt"
  end
  test do
    system "#{bin}/mt", "--help"
  end
end
