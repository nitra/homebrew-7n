class Rules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "1.10.0"
  license "Apache-2.0"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a2224f-94b6-7983-ae08-a642baa4ecc7/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "bdaa7ba54042fe12a1a209f61a6df4d0d7eb1b18155b0ab487921bf12b8d45f3"
    else
      odie "rules: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/rules-cli-release/01a2224f-94b6-7983-ae08-a642baa4ecc7/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d91317ba3d64c6d5593a8a3cb2368e697f7e806500557a313979f8d0abcc808d"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/rules-cli-release/01a2224f-94b6-7983-ae08-a642baa4ecc7/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff9e9a6b44f9e7e702f91c1e5140717ce02ccd7c99f55315c5fe1b71068bd8fe"
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
