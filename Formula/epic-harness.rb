class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.6/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "9cd2af62ed7327229e58e961cfba2f9002aaf693a307db90c15fb8739772b987"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.6/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "467801bf8c131d37721437dae415ae3e9c82ee87c4bc8a081ececfe6112d5f53"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
