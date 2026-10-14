class Schema < Formula
  desc "Ory-authenticated publisher for Apicurio Registry JSON schemas"
  homepage "https://schema.7n.ai/"
  version "0.2.2"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/schema-release/01a13906-5597-73a0-a522-97793d1bbe22/schema-aarch64-apple-darwin.tar.gz"
      sha256 "ca3255cdf12e53eea9f285bedb3a0fe826654ea952c7b1cb069baf352e216a2c"
    else
      odie "schema: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/schema-release/01a13906-5597-73a0-a522-97793d1bbe22/schema-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cafb386928e3d2046d6f7864454e9d453f70fa2693c0e78789d14bccb9b9c1aa"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/schema-release/01a13906-5597-73a0-a522-97793d1bbe22/schema-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c325c1b4aa949ca3e4077899a931a8441dc649809cceb07377fbeec6fcfe9bc1"
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
