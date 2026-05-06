class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.0/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "2ec157efa3e9809793690e31b41a47dfb3af50da93be2dfe7a45c9fbe39ed617"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.0/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "25e52a4022c527e67946ac0f057856892d25585f1bcb532a8520d8b3faa380c5"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
