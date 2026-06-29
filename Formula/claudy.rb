class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.11/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "6ad93ca0b4a7c1727ec82eec29ffdb3e352fa89723a84c4eb7bc294454f3d5e5"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.11/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "e88a49558af826d1053dc0b83df6d70ecf5bccafc9f9f10f86697e6f3de48016"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.11/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.11/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4c80390483d5ed0949fb40deb5275e09c8ea4dd5835846d48648bac70375f9d3"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
