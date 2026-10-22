class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.4.0"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1642d-3dbb-7a00-995c-38a458a0d0dd/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "0635bcae35532ba7bab69a416bf85b7b535a7eaaafb108b4f1b58d31d33990bd"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a1642d-3dbb-7a00-995c-38a458a0d0dd/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6087cf623901a016a8ad5fcd717513b0b5926493bf43ea7e9d2f4a362d33932b"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a1642d-3dbb-7a00-995c-38a458a0d0dd/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6d32123f03a61c361f8bc766521efbb06d09b37c895b26dd76ef204862f9c17"
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
