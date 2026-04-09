class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.3/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "6cdae3f64e99e189adfdef174b3abaf2d72c5313fb3213d48dca30e67294df49"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.3/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "bcc03f8732a0c6f2d965d3b76488e245d4f0629580c57bf44b8ef0a94eaa537e"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
