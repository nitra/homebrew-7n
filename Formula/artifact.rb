class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.7.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.7.0/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "26cbf7512618fa7ccf17777493b49fb28d8f289f17d57a93ef75096e96aae8c3"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.7.0/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8435f2a3ebf68feab7b3b165d757b4bfbb958cb86ac008e3d047dc061fb21d1e"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.7.0/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "950fe0a399896f7b3cc33be8d2a79a7799fd6ba7a87ec8002b04e276be027deb"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
