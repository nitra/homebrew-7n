class Tea < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/tea"
  version "0.22.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a2088e-e8d8-71a2-af58-4af54f01399c/tea-aarch64-apple-darwin.tar.gz"
      sha256 "1a11c6abf845f65d8e7660e52ee04641f289b17685d45337d276ab7b5302dc8e"
    else
      odie "tea: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a2088e-e8d8-71a2-af58-4af54f01399c/tea-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2dfd883fdcd634beac130ea14a3fcf6b5fcb661ebd91f1352edb89d4a99ed438"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a2088e-e8d8-71a2-af58-4af54f01399c/tea-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "59e4bbc45122f2ed10ea9b00839c2582bfd6bea3e39ecc7947887052510aacee"
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
