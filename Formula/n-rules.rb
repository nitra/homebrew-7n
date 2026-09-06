class NRules < Formula
  desc "CLI еталонних правил і skills @7n/rules"
  homepage "https://git.7n.ai/7n/rules"
  version "0.1.0"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/n-rules/0.1.0/rules-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ca68d76d9f62c42d6143c834340cd340a4a76d4aa517f17d30d2b2942c71507b"
    else
      odie "n-rules: Intel macOS is not supported yet"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/n-rules/0.1.0/rules-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3498d8749db3ed9a8581e1f50be354ba633126fec5ad809f01ed2f808d09e394"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/n-rules/0.1.0/rules-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "83eefa7dbcfb22efd45fd29a885798849406dd5fb511e9bcf0f17af575565c48"
    else
      odie "n-rules: this Linux architecture is not supported yet"
    end
  end

  def install
    bin.install "rules-cli" => "n-rules"
  end

  test do
    system "#{bin}/n-rules", "--help"
  end
end
