class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.7/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "fb449c71af03a1e0448868b21703456789055c5400e045d276c05f652bd87e14"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.7/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "094743b3022e0c903a5f37fb02fc0b63d95e135ccc8908a69eed60216e80bfd0"
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
