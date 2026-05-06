class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.1/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "546644206053de0177b382a28c583561fd6ae071b0a5613ee0074d681b23865a"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.1/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "fe7219d1c4d988bdc006e0da85578f1a10ffbdd8d51e83df4bf683a649d6e833"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
