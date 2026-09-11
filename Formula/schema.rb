class Schema < Formula
  desc "Ory-authenticated publisher for Apicurio Registry JSON schemas"
  homepage "https://schema.7n.ai/"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/schema-release/01a08f4a-63e8-7093-a7b6-1db52e4d9b78/schema-aarch64-apple-darwin.tar.gz"
      sha256 "dc08307dc9bdb5a483a4270e813a6f2aaae46bbb4624f57eb562cbd6dcdabd00"
    else
      odie "schema: Intel macOS is not supported"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/schema-release/01a08f4a-63e8-7093-a7b6-1db52e4d9b78/schema-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "010e521cc890ae13283646578c3a1efeeb793e2147e1adbac3bd9e0213d59488"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/schema-release/01a08f4a-63e8-7093-a7b6-1db52e4d9b78/schema-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "800fb5b90739d4ada62e1b062373496e312a47c53cd5eb119b1d24a4bd0e82e0"
    else
      odie "schema: this Linux architecture is not supported"
    end
  end

  def install
    bin.install "schema"
  end

  test do
    system "#{bin}/schema", "--help"
  end
end
