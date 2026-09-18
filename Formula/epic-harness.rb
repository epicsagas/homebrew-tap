class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.6/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "60f59cea87ff6ff28475ca6a0b1cdb49f5967e697bdc98f056186e352fd9128e"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.6/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "7e332accd9e979a7feca4e78d650343bf369f7c51af7e206baa8bd2945a31b3a"
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
