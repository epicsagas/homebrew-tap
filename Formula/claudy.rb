class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.9.0-beta.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0-beta.1/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "1486ee2826b6f335005facff65be5b3f23b677e7a9b6ff5b35d9f11c0d17cd7f"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0-beta.1/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "fb5c4862eddc3e70b1fde7ccc829064663d5ba481daabe49e677d2a8f8ada6e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0-beta.1/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0-beta.1/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "652894d2a4e4a8dadf90fee12da1f671f6024ba058d982c807cb0271753ae9c8"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
