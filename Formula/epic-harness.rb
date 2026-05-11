class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.5/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "c74ccf9eb8dc950fa92a87a48f3e941bb9d448ed13fcd503ae41ebba9fadb77b"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.5/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "340b386b9c6172f86ad552b3b9fdc6da663b5d867ea13f5426d84c76c67c3e43"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
