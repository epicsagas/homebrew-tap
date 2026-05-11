class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.7/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 ""
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.7/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 ""
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
