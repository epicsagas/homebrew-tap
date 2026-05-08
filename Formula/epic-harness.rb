class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.2/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "f9196966fe86af475d06d6111b14abb1c7056ca35eb18f86856951c737bd4fa3"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.2/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "cf1b34a8cd66ffb879dc9e347f653259be1b333c41ae96b3d23445be8b8d540f"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
