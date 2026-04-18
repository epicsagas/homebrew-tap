class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.0/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "064180912301dc2c1927ac35c423ab4f2ccf1e5a24eac70b415a77ab1f31ce10"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.0/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "a398410fe618034bd329a151fd76648219dedbc6270afb222be18bb414f3bf42"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
