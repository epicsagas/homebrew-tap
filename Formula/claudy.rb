class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.9/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "3e69b65b7d36df5be4562c75efff5ac20602a94a977b40ac78ec0078a1a4bd3c"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.9/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "69479cbecd5a6df0a542c24e798341c3eeeab8598027b066fe17b0a916c08f9a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.9/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.9/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6360daa33a7fa0c48169b88cacf12d686317a4d5dfa20119b8f6c600c8cde857"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
