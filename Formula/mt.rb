class Mt < Formula
  desc "mt CLI — задачний граф @7n/mt"
  homepage "https://github.com/nitra/mt-rust"
  version "0.1.3"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.3/mt-darwin-arm64"
      sha256 "6cc7692ecfef266416c2e280d0526d4d610b97b5f87e2073c2d1bce13056a4f1"

      def install
        bin.install "mt-darwin-arm64" => "mt"
      end
    else
      odie "mt: інтел-мак поки не підтримується (немає x86_64-apple-darwin ассету в релізах mt-rust)"
    end
  end

  on_linux do
    url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.3/mt-linux-x64"
    sha256 "fa30a42078f352ce9c107eb4ee84c605934588406fba2c3f1dd1baef67d51455"

    def install
      bin.install "mt-linux-x64" => "mt"
    end
  end

  test do
    system "#{bin}/mt", "--help"
  end
end
