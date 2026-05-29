class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.8/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "4ca152248d2d088164c004cf8a2a394fb269fe4a17fb9850fccd7345cdb9f8bd"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.8/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "fa59be7ee555c87d3544fe9094de99589cda85542622909ac09d10f4efa063fc"
    end
  end

  def install
    bin.install "epic-harness"
    bin.install_symlink "epic-harness" => "epic"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
