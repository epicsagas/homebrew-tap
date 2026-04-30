class Alcove < Formula
  desc "Private docs server with hybrid BM25 + semantic search for Claude Code"
  homepage "https://github.com/epicsagas/alcove"
  version "0.8.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.7.11/alcove-aarch64-apple-darwin.tar.gz"
      sha256 "5eac596de5c9bc34b7755b9bef9e8d7f0a0e1c9641f4d47ee761b658b0f76e87"
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
