class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.3/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "0b626db6e65276728e76b0cba730614089560b812d3dc29c94da9f94d0e46d16"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.3/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "9d205257a528713badbaa4e89b67c9b07de780f1a6387347c48336a163c855ae"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.3/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.3/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "29fbbf710d5c44c42f21f9ec3d6999b316b0cc22d86806071cc07467f6787035"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
