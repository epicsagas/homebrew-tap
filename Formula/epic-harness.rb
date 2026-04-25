class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.1/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "68d726e6b038faa959b70f4d863b62bf5b355f2a37d60217f3a0ccbd3e01234a"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.1/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "2cefec1fa15a8b319d69dec32f9df787ed08e5213a593c48ae15fee3573e330d"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
