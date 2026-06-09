class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.0/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "bd74fa5111696373bd1e783250302a372be169f712c981179041d758406d5cfc"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.0/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "9771a0d938fd10208ff93fc0a5d4962eebd1b9ce16225639ccbfc68550f64e06"
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
