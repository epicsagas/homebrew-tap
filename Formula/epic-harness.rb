class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.12"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.12/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "30be3ec9b878cf1a1e75f34553094cccb95a1c90346c0198526c760c0ea02141"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.12/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "8c6396c93084ae5bea0b29d0093b1c5dff9eeb1376cb6b4c3e989d60a5e754a6"
    end
  end

  def install
    bin.install "epic-harness"
    bin.install_symlink "epic-harness" => "epic"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic version 2>&1")
  end
end
