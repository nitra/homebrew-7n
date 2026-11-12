class Workforce < Formula
  desc "Коментарі між вузлами Metatask для людей і агентів"
  homepage "https://git.7n.ai/metatask/workforce"
  version "0.3.0"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1cebf-f6c4-7040-bea8-30933bd6e912/workforce-aarch64-apple-darwin.tar.gz"
      sha256 "40b58f786e48d12b783ad0924f93cc4f07ecdbe914b2a5c1ec9b5e1e07d6e939"
    else
      odie "workforce: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/workforce-release/01a1cebf-f6c4-7040-bea8-30933bd6e912/workforce-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6436034166f4d4f5f5877c9bb7e1761f196c6525ff6c888c08ceae40cf665de0"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1cebf-f6c4-7040-bea8-30933bd6e912/workforce-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b051dd7781346384da3ee4c55c8ea6c5c9f06f3db265c1e5adec399b9fe0a85b"
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
