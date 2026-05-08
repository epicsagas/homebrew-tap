class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.0/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "edf9aca10e1cea44a189ea6608d086eaeca07a47b8ab69d31c8e3eef76006122"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.0/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "b9fa069ec4956964bdd051f5d7ede95af178963d537b7e814b6eea385ea2af09"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
