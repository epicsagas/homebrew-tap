class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.6.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.3/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "e3cc819c816d3c1b1a70ad71992412429164f2a3a676f5d778abec563aa89c3f"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.6.3/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "9e8f88f4214cc6a1dc8be2c3e560265de36c89446ce937636dd20df2e1db3d9d"
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
