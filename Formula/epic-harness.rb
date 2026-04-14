class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.9/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "144afdffebf24b596d6c6eb9b5def71cd212184c9db999b7d4c31b5ea6ee72b8"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.9/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "15259b71c299943c5252ef76ef71830b1df8e2f09e00b75adaad43e4724d67cb"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
