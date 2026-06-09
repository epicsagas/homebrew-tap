class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.1/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "730ed8eeb681332dfacda93454aa73bb461a7636fe01e28379a334eb46a408c2"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.1/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "54b125755886c1bac06b6506a042cb77a6f8d70b66a4e855a6b21c0c9f6d84e1"
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
