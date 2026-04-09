class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.1/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "3ab2ec99920e2802151f689780f9d4df1b80e9f3400a02fd98b95eec5b344b41"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.1/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "60402384b6289639b5267927986b840769fae8954dc54b1c5fc1b7ce8da3be40"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
