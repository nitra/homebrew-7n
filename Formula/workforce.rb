class Workforce < Formula
  desc "Коментарі між вузлами Metatask для людей і агентів"
  homepage "https://git.7n.ai/metatask/workforce"
  version "0.3.1"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1cfc9-b99c-7740-b3a9-1d2af26d6bda/workforce-aarch64-apple-darwin.tar.gz"
      sha256 "a5894116b270252d28b3895555667a964f95e169eab0c28e39354db4e4a233f9"
    else
      odie "workforce: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/workforce-release/01a1cfc9-b99c-7740-b3a9-1d2af26d6bda/workforce-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "188d39964d876420d90dc27c2f44048315a3d1e3609f21cd88769a704bd2c737"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1cfc9-b99c-7740-b3a9-1d2af26d6bda/workforce-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "754a3b1d8553c83236dca99a24803a611cad827c1c076f7664b27c7f0eb58425"
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
