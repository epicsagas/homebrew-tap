class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.4/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "be7f75f2daae62063e0bf5f47b6b3eee720dbd807f0ef4c5a81706eeec90e175"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.4/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "be457bf2b42a0e440ea5fc9f5186b080142906c72d5f8e362a5d434f21363dd1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.4/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.4/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ea191109fe484536d5a01f3a56a8dcdf31c1ae444d5d1cf83615d9f2de510e61"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
