class Workforce < Formula
  desc "Коментарі між вузлами Metatask для людей і агентів"
  homepage "https://git.7n.ai/metatask/workforce"
  version "0.2.0"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1caf5-274a-7953-bb52-ab949b1d69dc/workforce-aarch64-apple-darwin.tar.gz"
      sha256 "25b9b551de62998c40e67a9b7aa733a9b65b75141f5532aa7228228010ca541e"
    else
      odie "workforce: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/workforce-release/01a1caf5-274a-7953-bb52-ab949b1d69dc/workforce-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4419603141d6e64611434359ae482b58cf9108743dd494e38368ce9b63c36a62"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/workforce-release/01a1caf5-274a-7953-bb52-ab949b1d69dc/workforce-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "85c8736dcf69977bef1c50f91dcd784254137b78b648aea08b51393ff3579add"
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
