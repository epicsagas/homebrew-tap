class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.1/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "3d2099aa8e433cc9b405112f7f7089b81198aee746264cc7178546ba61e91620"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.1/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "28184e68de51d0b79162c193dade3f11e7b00e9489852f0c8318ab18243ababb"
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
