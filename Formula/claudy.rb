class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.1/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "c3e0335cbb8e983f750a8304a2c6fc0029c75567416809dfeaad232cde1f4820"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.1/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "f560e77d0021e680bc2b2117ebb1cde9ab7dfb7c7ed8a3523ea73686c45df8e5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.1/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.1/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2073af670d6b316b06637287be9d59e009d6a280d64d5b4c1efb83a8592de1bd"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
