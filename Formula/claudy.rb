class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "98e1f4e4923c1c62709d4a6c43bec8a81ac2d90e068876b068ca727e5b5681ac"
    else
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "65a36a1ce983da2c58e897c685134e876b6308c86c69e64b40c66a4df94f0842"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7c3075ed6d9be9a420aca4a9c2b4d446194f5bbde1d8ad3b321a400284853a68"
    else
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3ca843746913d4d1c531b6c1d2faf17ce696f93083ecc401464dc04fae11eb17"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
