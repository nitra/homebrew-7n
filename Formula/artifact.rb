class Artifact < Formula
  desc "Artifact gateway publisher CLI"
  homepage "https://git.7n.ai/nitra/artifact"
  version "0.3.3"
  license "MIT"
  on_macos do
    if Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.3/artifact-aarch64-apple-darwin.tar.gz"
      sha256 "bf71706127b522f64b82086c40e347bc178ddf2df89264aa290b300ad73c2ae0"
    else
      odie "artifact: Intel macOS is not supported"
    end
  end
  on_linux do
    if Hardware::CPU.intel?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.3/artifact-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "711fc061bec4c1f990c2eb5f6811183751dbb0b9e45209e143c481df648889bb"
    elsif Hardware::CPU.arm?
      url "https://raw.githubusercontent.com/nitra/homebrew-7n/main/assets/artifact/0.3.3/artifact-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "637573641d5fe3ef3c8f14fd0fade73d4ac135dccf74196100fa0f191edd7f18"
    end
  end
  def install; bin.install "artifact"; end
  test do; system "#{bin}/artifact", "--help"; end
end
