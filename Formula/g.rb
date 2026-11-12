class G < Formula
  desc "g CLI - git delta tool"
  homepage "https://git.7n.ai/7n/g"
  version "0.2.5"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/g-release/01a1cee4-edc3-7d01-9096-be5d5da57573/g-aarch64-apple-darwin.tar.gz"
      sha256 "62933f48ad847bc59b62a460591680c8d92f522d73a4e44c1165b71382e67e58"
    else
      odie "g: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/g-release/01a1cee4-edc3-7d01-9096-be5d5da57573/g-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2330d940ec7675afd89db89d9b1eddac02bffb8de4f50b504497fcb87d4f729a"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/g-release/01a1cee4-edc3-7d01-9096-be5d5da57573/g-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b5f083f0690f72cd77e48d9151c9aa4f81442fffc3e470edbd92b918069344a7"
    else
      odie "g: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "g" => "g"
  end
  test do
    system "#{bin}/g", "--help"
  end
end
