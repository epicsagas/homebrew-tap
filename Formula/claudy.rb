class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.1/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "595991709136a714055f6fb9e871a186ebb7e66de349caa06be661464b21cfa6"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.1/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "c3b06c5941280729726c6bf430e3fe316054d9ab392c7e098db51557d95bb777"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.1/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.1/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7b0fb48bd4d59848156ce207023bfec1a9235a7abcfc8ce37dc2bf9951fc26db"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
