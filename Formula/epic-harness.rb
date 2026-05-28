class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.6/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "ac34196f2c70826fa1af70595ab7126afca1a2da3ee5c53c8262d071a8bc82ee"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.6/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "e2ed368cd80b2bf846ae298a47e3dc54c89bc2af7bc952598c125cb68446e242"
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
