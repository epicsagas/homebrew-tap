class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.2.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.5/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "465648f095e40cbcef847650e379598282db5cd455f1072d29a7c7fd6e13f98b"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.5/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "b6144ca3218ed9617461f32aeff4521359e56756d3e824e1365148a771eb48cd"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
