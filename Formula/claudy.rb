class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.1/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "31a3a121bf4215b854bd18b2d9b4798e0c15426204f86c230e462844761bc4cf"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.1/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "2b5a6ef3a0a76c2a492e1880fa3811c81951990edabdb07354390685c62a663f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.1/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.1/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5310145b24b0738719f4dac7646f2d8c9ccd2e4ac7167edf95b7c2f127ef0f34"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
