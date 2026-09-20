class Mt < Formula
  desc "mt task graph CLI"
  homepage "https://git.7n.ai/metatask/mt-rust"
  version "0.2.0"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a0c03c-04a6-7fa0-ac65-ab75ebd308bb/mt-aarch64-apple-darwin.tar.gz"
      sha256 "fb0b279b819fbac2bf2fd2a0df48e9bc2125acee03e906e14af6822d28669b76"
    else
      odie "mt: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/mt-release/01a0c03c-04a6-7fa0-ac65-ab75ebd308bb/mt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "923729eafd499d89e272bb956b3e8afcfeb0e218f05ec81ba4cc94b3716890b8"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a0c03c-04a6-7fa0-ac65-ab75ebd308bb/mt-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8cfe4efd69560c66541ada0bd491bbe1046aa68dbdcfd5af906c58109d687175"
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
