class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.0/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "bddcaee4c7631bb5ed6911bae5efb8a957d165ca0358bb6d4eed67f703491c7e"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.0/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "a7a9969a924a614353069851233ab618309f85fc0138bf97edf7c67fca072261"
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
