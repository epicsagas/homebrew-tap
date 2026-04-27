class Alcove < Formula
  desc "Private docs server with hybrid BM25 + semantic search for Claude Code"
  homepage "https://github.com/epicsagas/alcove"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.7.11/alcove-aarch64-apple-darwin.tar.gz"
      sha256 "b315ea410327ce11ca0606f191e9d4cd39bfcdc3e59ca83babbf24ab3f928804"
    else
      url "https://github.com/epicsagas/alcove/releases/download/v0.7.11/alcove-x86_64-apple-darwin.tar.gz"
      sha256 "a5b62ee27c32ab8d5b9ea5bb09cda1bbd16a93e4f094fa22ea321bb4ec4eb9aa"
    end
  end

  def install
    bin.install "alcove"
  end

  test do
    assert_match "alcove", shell_output("#{bin}/alcove --version 2>&1")
  end
end
