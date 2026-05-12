class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.9/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "76e40b1302aa363a122de17430b71fcfbe31ab32971e1fdb163fdca64e8ae986"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.9/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "13fa91ac2f2d2beaf16f36bd0b568ea0114c6f3ec01c8357f5623756a8b0b173"
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
