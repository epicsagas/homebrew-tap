class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.9/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "a035792c41eb1c67b480ceaebe726d50824cd01d89795f0916340757a7efe1b3"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.9/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "9b8c9b412257a2c29a17580750a5168a7d597859628133c26f35897e9c230e34"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
