class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.5.0/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "c085f226e823b5992d9b54b5666e58d162b40e845ae5faee24a26e37771465e8"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.5.0/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "3345cffb83d1230beb0dec3e9ee7a08061831a3a9bbb051c6d1202dece76a459"
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
