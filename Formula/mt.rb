class Mt < Formula
  desc "mt CLI — задачний граф @7n/mt"
  homepage "https://github.com/nitra/mt-rust"
  version "0.1.43"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.43/mt-darwin-arm64"
      sha256 "9554129a625cf233f1c7601081ae94c396f8ad4941c5f1313a082779bf4befcf"

      def install
        bin.install "mt-darwin-arm64" => "mt"
      end
    else
      odie "mt: інтел-мак поки не підтримується (немає x86_64-apple-darwin ассету в релізах mt-rust)"
    end
  end

  on_linux do
    url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.43/mt-linux-x64"
    sha256 "7467e18214330146a53e5cf857b920cbc324defe62d1c7872cc31c27d511eb27"

    def install
      bin.install "mt-linux-x64" => "mt"
    end
  end

  test do
    system "#{bin}/mt", "--help"
  end
end
