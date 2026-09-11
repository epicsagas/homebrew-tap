class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.5/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "0f2a5f3d865b0a44064035d697f6f928039fcc5fa6498647da1b5eb408fecde2"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.5/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "6f06e2f9896041ae2b4ff9b5b7a2bd7b6e0f1da26992e11d0cf124a9b1de37e5"
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
