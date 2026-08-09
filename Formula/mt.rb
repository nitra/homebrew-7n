class Mt < Formula
  desc "mt CLI — задачний граф @7n/mt"
  homepage "https://github.com/nitra/mt-rust"
  version "0.1.15"
  license "ISC"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.15/mt-darwin-arm64"
      sha256 "94409676ae285f5abaab20a8fcb5691c478c62079adf41d67665af170293458b"

      def install
        bin.install "mt-darwin-arm64" => "mt"
      end
    else
      odie "mt: інтел-мак поки не підтримується (немає x86_64-apple-darwin ассету в релізах mt-rust)"
    end
  end

  on_linux do
    url "https://github.com/nitra/mt-rust/releases/download/mt-v0.1.15/mt-linux-x64"
    sha256 "5aa5bdc1d0186b75c7e840361bf21a143a18c1caa9f79228a85aedc6de8de3a1"

    def install
      bin.install "mt-linux-x64" => "mt"
    end
  end

  test do
    system "#{bin}/mt", "--help"
  end
end
