class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.2.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.4/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "a371ad653d4ac3f9a316473ff8b459d40abab03e8eab33857c79097c35163223"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.4/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "152d185be3373292477d6ba06b0f5e14def49359ad1fc18042e4b72ba5527a54"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
