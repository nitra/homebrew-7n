class Mt < Formula
  desc "mt task graph CLI"
  homepage "https://git.7n.ai/metatask/mt-rust"
  version "0.4.1"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1c5d8-4d70-72f3-91dc-389a92fcc0bc/mt-aarch64-apple-darwin.tar.gz"
      sha256 "8c731dfeb9e2823dce645756f77deebfad2db030e7c29816566ac3fc28be869e"
    else
      odie "mt: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/mt-release/01a1c5d8-4d70-72f3-91dc-389a92fcc0bc/mt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d30c45bf5bb1b63ccaeb02d479aa92f58c016536afcab46e990ebcb6bfd3cb9e"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1c5d8-4d70-72f3-91dc-389a92fcc0bc/mt-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1986d825c9bc8ba79649fa7df2108a1d7a283c61ce023788a7af932e7c91ad39"
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
