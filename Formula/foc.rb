class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.19.1"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a145c3-73ef-7a01-9500-280b23b7b81b/foc-aarch64-apple-darwin.tar.gz"
      sha256 "5975fa0102c770403ac97a4ac6c5fb61e23e25d8ff10ab0890863d119813eb73"
    else
      odie "foc: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a145c3-73ef-7a01-9500-280b23b7b81b/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3cf188219eae1668563b457b5c09290165122ac429ff64c7b652892ab083dee4"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a145c3-73ef-7a01-9500-280b23b7b81b/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "470eba484b0943b48abc9e3e668b5db2cdb5502975bd79b31c8ebecf9bcd35dd"
    else
      odie "foc: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "foc" => "foc"
  end
  test do
    system "#{bin}/foc", "--help"
  end
end
