class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.7.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.2/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "cd086d334f89a51c3799edadecffc9efdd6cb5cf142bfd22e472d1e57f2ce0b9"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.2/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "ff7759d5abe48c3cde1b9d5761bf8e0ee3220f5cc18b98d834b04adc62d1c803"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.2/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.2/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c7775daebef3ec27c8598cda84bca8125a0f816172b8d8c5d9ef081bf259c51f"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
