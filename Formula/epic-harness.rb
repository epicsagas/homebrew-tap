class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.3/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "22f6828d53fbabdb784b06d2bfa21b51db93f67a7aca9de939bf584b74571d4c"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.2.3/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "71d2c2f468c88d1e78a1055007739334aead42ef69f503aefca6a21427ba65b2"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
