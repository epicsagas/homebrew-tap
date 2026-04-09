class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.2/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "33a9eea09bbd6f255b4f465e2fa4b838cf83b60ecf651170dfbf293fce863448"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.2/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "7bde5ce391191c383f4dd4da57d4c16358c72ca2c2ba464e70ac162c51a7ae0d"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
