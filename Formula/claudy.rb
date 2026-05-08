class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "342cc2af3852d8a69a970f3fb8d1bedb5adc9643d8a50bc537e5df1695863341"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "150e37befde45d57983aeaeeb40a06e4bb625229996a143301d285e060f37491"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1c253afba6d02326b2420d83e6b1963fd59761aa50f4a45eaa3e2fc18996ab69"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "28424e103426dfe392fee83a031d3a82886b7c28a721b6d306a2a5977e239e94"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
