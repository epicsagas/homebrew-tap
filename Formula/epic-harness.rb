class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.1/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "705f016acdc496ad18f31ee989a942016d6be0b2d1f3fe35b0cb4b60b7968a5d"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.1/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "5d0c7f11cf87f7cc3409c3a5634024919b0300dcc551339432120795763aa27c"
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
