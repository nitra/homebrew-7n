class Mt < Formula
  desc "mt task graph CLI"
  homepage "https://git.7n.ai/metatask/mt-rust"
  version "0.5.0"
  license "ISC"
  on_macos do
    if Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1d042-e256-70f1-bff1-d9fc06fe834d/mt-aarch64-apple-darwin.tar.gz"
      sha256 "7bff0965145e5abae17599924037b99a126163a5bdbd6eecacdbd7ae8a48cd9d"
    else
      odie "mt: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://7n.ai/artifacts/mt-release/01a1d042-e256-70f1-bff1-d9fc06fe834d/mt-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "45ea05e6380901e3847ce78c44d6af2642e27921d764267755d9c1504fbda8de"
    elsif Hardware::CPU.arm?
      url "https://7n.ai/artifacts/mt-release/01a1d042-e256-70f1-bff1-d9fc06fe834d/mt-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1c42204ba02ab6615afd9e9849c3b12ab224645220e8789d4dded5eb72f73cd"
    else
      odie "mt: this Linux architecture is not supported"
    end
  end
  def install
    bin.install "mt" => "mt"
  end
  test do
    system "#{bin}/mt", "--help"
  end
end
