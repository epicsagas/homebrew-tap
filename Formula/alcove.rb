class Alcove < Formula
  desc "Private docs server with hybrid BM25 + semantic search for Claude Code"
  homepage "https://github.com/epicsagas/alcove"
  version "0.8.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/epicsagas/alcove/releases/download/v0.8.5/alcove-aarch64-apple-darwin.tar.gz"
      sha256 "8953087da6f60a1ca1c66dbad84fc443f67bdda7cb789854d45e6e96ea078208"
    end
    on_intel do
      odie "alcove v0.8.5+ no longer provides Intel macOS binaries. Use an ARM Mac or build from source."
    end
  end

  def install
    bin.install "alcove"
  end

  test do
    assert_match "alcove", shell_output("#{bin}/alcove --version 2>&1")
  end
end
