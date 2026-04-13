class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.7/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "7be9817aa5e7f02df2e664ee75897caab04a3534d177b7556acb375fa620ab63"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.7/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "cc7bd972467ac4d27cdb247a9b9cb637be781ac477f7a4963b3146971fdf43e9"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
