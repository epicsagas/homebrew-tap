class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.7.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.1/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "6568cb1329788e67e922126a153f45e68067e4d342d862eb67ba11f512e0c970"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.1/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "af3dcb808f67d89d81723e4b8a5006b8505dc9befbd2f995d987dc50e8c1dc19"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.1/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.1/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a6ab4e7c72c367921dea08c9768b79a1e6fe9f836d95f326e859fec27f00e98b"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
