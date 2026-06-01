class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.9/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "bd2db2e47ad622f8532aed0a472119e43a767879c9ddc248d0029d39d2d315dd"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.9/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "aeb7c4248bd25a30a075ee732dc61411216610d0bcdf62a32f0c62e441fab21d"
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
