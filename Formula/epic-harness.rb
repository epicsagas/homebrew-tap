class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.5.1/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "f5c9347fe81c8c99ce793794ce6cb61921226181dc5e4768ab681e9e0badbb80"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.5.1/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "d41c55f7d650d1c7a40fb9d8ee52119da4420fe11bc279c1690a97d91e9bde4d"
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
