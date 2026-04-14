class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.8/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "d2ba170376e89f43438cbd6d70c806018e5f58c0735d1236298dca3162b49ce1"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.8/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "a5439c922543bee6c5e338f115ff57cc791412bbda577b1e4e000e82558382a4"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
