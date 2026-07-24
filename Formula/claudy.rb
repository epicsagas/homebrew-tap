class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "789a1778ff8ed138878b96f57a7a88eeb4ba3b78997d00ab449bb5812b62e02b"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "2ec70c557d144dab8d5b225eeb60228ebb48d254ae705a43e1e180b29cf888cf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.6.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "86de5c5e0615dea4067747abac7ce1a3c8856a3c7dd5a981163d3281c05d44cd"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
