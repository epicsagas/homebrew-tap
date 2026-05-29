class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.7/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "eb88523096b1a9e38eb7b3e207b4e104e6ef79647d26176edf96c0c8ee4862ed"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.7/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "ac94e2cd82e1225b4a3d0ef9c0e7ddd5a95961a288302ec7f64c28e64004104c"
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
