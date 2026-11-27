class Tea < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/tea"
  version "0.23.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a21c49-635b-79b1-92b9-98a62938c415/tea-aarch64-apple-darwin.tar.gz"
      sha256 "cf45dfaaf6a2f4887b673fb852206419d884ecd5eaa58e80bf28c31ac518fe7a"
    else
      odie "tea: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a21c49-635b-79b1-92b9-98a62938c415/tea-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a63689a58d6e72503bf87aa6af45f740f3df1940e1a118de6fcee60099d46e6e"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a21c49-635b-79b1-92b9-98a62938c415/tea-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dffd1765efdad075df14d54a6d7041b2b312a2a3a2eccf8bb6cae748d112eefa"
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
