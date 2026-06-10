class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.6.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.2/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "b006aa505f063173eee99ee321436d0a3884725880237ca2d093fa20828acc02"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.2/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "4addae8d44c41926ffd5b25a296ca75833211550f9e202c983e86d66ae51d4c7"
    end
  end

  def install
    bin.install "epic-harness"
    bin.install_symlink "epic-harness" => "epic"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic version 2>&1")
  end
end
