class Foc < Formula
  desc "Forgejo-first command-line client"
  homepage "https://git.7n.ai/nitra/foc"
  version "0.18.7"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a10017-9785-7633-9930-95146d8be301/foc-aarch64-apple-darwin.tar.gz"
      sha256 "8f2b541515b54e966a70c6c51c86a65b188407d0979400ea2dfb42b261ba7bbc"
    else
      odie "foc: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/foc-release/01a10017-9785-7633-9930-95146d8be301/foc-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2240340ec420351efc886ddf5680ac4f2b8bd06d93d1c172c2f88040711e8425"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/foc-release/01a10017-9785-7633-9930-95146d8be301/foc-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "700b6a9e9e6694bf50883816297b2daf26fd90116ab2382b590e375d65ba5f45"
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
