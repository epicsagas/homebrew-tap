class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.2/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "851f6216b784d32e86d11f5bbb6fa7e481a77033b2f02e29e83543ea43de77d2"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.2/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "c99ab163b40a06a64ec8ec272dd796312c9b3661fd91e30a5b74f9224ea7382b"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
