class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.6/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "67d55c11d62c28db440ebb948c6523714e70925b971e5ba3d470e9d795c3da11"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.6/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "06dabda5fb4e069d14bcdeabf784f4eeaedd03f1ca0f05232c503382e6d567a7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.6/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.6/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1cd39144c2f59682eaee9b4c724e146844b325f7d45646bc1eb96cdbde771038"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
