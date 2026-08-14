class Mt < Formula
  desc "mt CLI — задачний граф @7n/mt"
  homepage "https://github.com/nitra/mt-rust"
  version "0.1.44"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.44/mt-darwin-arm64"
      sha256 "3e13f214d7f02b1ce1e7aaf108386fe44d7dd654eab0dfdfc3b8a865b89e9926"

      def install
        bin.install "mt-darwin-arm64" => "mt"
      end
    else
      odie "mt: інтел-мак поки не підтримується (немає x86_64-apple-darwin ассету в релізах mt-rust)"
    end
  end

  on_linux do
    url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.44/mt-linux-x64"
    sha256 "c5494aaf6422281bd8f63c6e99363d75dc183beaae43edd5b8089f49a1106ed3"

    def install
      bin.install "mt-linux-x64" => "mt"
    end
  end

  test do
    system "#{bin}/mt", "--help"
  end
end
