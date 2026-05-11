class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.8/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "f68d50b59a4c9cf6eccd26b67de9889d6de0fd698fbd4a9b800d06353700836b"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.8/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "c2b11dfe765afa31ddaec4616fb8cd96bb4c1589d6cb322b5bde68c18446fd6f"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
