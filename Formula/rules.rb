class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.9.0"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a21282-8e91-7e01-97a2-ecdbab2ad4f0/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "80d02c0fdeeaf242fefc9fced36a0a54642dfe7ea30847f28d83efd032eb562e"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a21282-8e91-7e01-97a2-ecdbab2ad4f0/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0bc2084405ec66119493984569e3f06de69fc037454bce61f1a7b6706b744735"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a21282-8e91-7e01-97a2-ecdbab2ad4f0/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f7540a2183c9d8bc39a6a8da05daf491e1422998531272af74e36e474cf63175"
    else
      odie "rules: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "rules-cli" => "rules"
  end
  test do
    system "#{bin}/rules", "--help"
  end
end
