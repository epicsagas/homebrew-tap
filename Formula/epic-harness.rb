class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.5/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "276f397ea01888130f7631c1f362eeaf7885041113fa275ba52f556dfcc4b581"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.1.5/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "090313c01ceb6ef766886acdd4106e4dfdd6d8b39849d429eb83a7eebfca98b9"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
