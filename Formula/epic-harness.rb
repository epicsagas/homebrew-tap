class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.0/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "581aecc0fafa2fd322289a4d698c01dde56207bb15e8f28e1b1086438c5d6c93"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.0/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "9901efc96ab0a3ccdfa6e69ee41f0920923386f6c5557f6c482e47b5bad30a1d"
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
