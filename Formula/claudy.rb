class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.10/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "f3d14d4e12ebc355036d7115c7e809a0a1dc8886a2964c089ad230edd27a2763"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.10/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "a44de4a0c69e3f9a60af2ed3debf9957b855fb4e647c2f365ec236b96752db17"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.10/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.10/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0b4bf790d9da8813d2249825b656b1ad426c1edcd552201bf7312bd61f57f169"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
