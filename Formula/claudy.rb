class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.9.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.3/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "07e4edbb8661c21a62583d94c681edf589ea7cbfeac81870bd2e96e70f563503"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.3/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "8aaed8c44f1650d16b5d29c87d35ac5e516abf1477a77ed763fe495a6a5557c1"
    end
  end

  on_linux do
    url "https://github.com/epicsagas/claudy/releases/download/v0.9.3/claudy-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "40cf1c71529386abb131c476035a1a9f9356e746e6400a2aeb86fdb0f02248b2"
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
