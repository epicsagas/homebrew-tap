class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "bfdbe923f17c3ea07f228357b464abb53446e533ed9890319cd37e9d4cd6e552"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "b9f5510135afc2882a2ca1a1fb3567b423667541a8ccf8fc208cf266948c97c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "92a1b021fadd99b6c9157a4be02bdae60feb85bfd944a48da0356492d6099fa0"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
