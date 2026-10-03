class Schema < Formula
  desc "Ory-authenticated publisher for Apicurio Registry JSON schemas"
  homepage "https://schema.7n.ai/"
  version "0.2.0"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/schema-release/01a0ffea-d04b-7a33-8d43-ddd76896c1e7/schema-aarch64-apple-darwin.tar.gz"
      sha256 "0329597aa852851421bb549ba5f5fdbdab0a2a6dcbf078743b88b0c78133cb9d"
    else
      odie "schema: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/schema-release/01a0ffea-d04b-7a33-8d43-ddd76896c1e7/schema-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c29e81c06761447054deba72de0da1964a0d2731b49391a02c216f9cde6fe228"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/schema-release/01a0ffea-d04b-7a33-8d43-ddd76896c1e7/schema-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce58bdcf4607736e18083bccead080971b77701907250a25d18d9a3cefcc4724"
    else
      odie "schema: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "schema" => "schema"
  end
  test do
    system "#{bin}/schema", "--help"
  end
end
