class Mt < Formula
  desc "mt CLI — задачний граф @7n/mt"
  homepage "https://github.com/nitra/mt-rust"
  version "0.1.29"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.29/mt-darwin-arm64"
      sha256 "e41ad22783df1cd56077b600159721b4537f5334f63ccf57d2d898919d3e2e94"

      def install
        bin.install "mt-darwin-arm64" => "mt"
      end
    else
      odie "mt: інтел-мак поки не підтримується (немає x86_64-apple-darwin ассету в релізах mt-rust)"
    end
  end

  on_linux do
    url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.29/mt-linux-x64"
    sha256 "4ab608e1e14d866c732cccdcdb2405395149f72bbd86256c69b62315db3a33c3"

    def install
      bin.install "mt-linux-x64" => "mt"
    end
  end

  test do
    system "#{bin}/mt", "--help"
  end
end
