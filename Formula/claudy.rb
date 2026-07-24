class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "24270edb7f82f44e5b940c68df2da90bbb65455233a20e03d2b7d319229b130a"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "6fd26f14b2cd8927bae2c4f1b34d51133a3426eaac94a7eb356e7712c08fcb0a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.7.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e524a33a31a025053b6d5678a4edf7fa8447ea8b6b1c0411ca4b76b6ff9e96a8"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
