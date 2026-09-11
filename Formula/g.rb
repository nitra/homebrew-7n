class G < Formula
  desc "g CLI - git delta tool"
  homepage "https://git.7n.ai/7n/g"
  version "0.2.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/g-release/01a08fae-07a2-7bd0-a4ef-c0689f30c216/g-aarch64-apple-darwin"
      sha256 "1cfe64877915d7e5ae7bb3dcd53072464c07a104435e1897eb0b477ef315ed16"
      def install
        bin.install "g-aarch64-apple-darwin" => "g"
      end
    else
      url "https://7n.ai/artifacts/g-release/01a08fae-07a2-7bd0-a4ef-c0689f30c216/g-x86_64-apple-darwin"
      sha256 "93eb8f95d1d40ed636d461be1e7558b22cd8ce3d916c6d68961c6ee24f9a25b9"
      def install
        bin.install "g-x86_64-apple-darwin" => "g"
      end
    end
  end

  on_linux do
    url "https://7n.ai/artifacts/g-release/01a08fae-07a2-7bd0-a4ef-c0689f30c216/g-x86_64-unknown-linux-musl"
    sha256 "0f8d4e826c7d69c65dba1151d0c1f92574ff0ca7670237c3929720b1d7835a89"
    def install
      bin.install "g-x86_64-unknown-linux-musl" => "g"
    end
  end

  test do
    system "#{bin}/g", "--help"
  end
end
