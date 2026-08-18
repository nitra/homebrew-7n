class G < Formula
  desc "g CLI — git-дельта інструмент @7n/n (скорочено від git; репо git.7n.ai/7n/g)"
  homepage "https://git.7n.ai/7n/g"
  version "0.1.2"
  license "ISC"

  on_macos do
    odie "g: macOS-збірка ще не публікується (немає macOS-раннера в CI) — постав через 'cargo install n7n-g' або 'cargo binstall n7n-g' з локальною компіляцією."
  end

  on_linux do
    url "https://git.7n.ai/7n/g/releases/download/v0.1.0/g-x86_64-unknown-linux-musl"
    sha256 "a62ea7ca75d75945668a9745e597e00e484b77cf4f9de48c4af2fbd4e1a1c331"

    def install
      bin.install "g-x86_64-unknown-linux-musl" => "g"
    end
  end

  test do
    system "#{bin}/g", "--help"
  end
end
