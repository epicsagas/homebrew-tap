class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.2/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "ba2676a290edcc41d37e017ac79bb1c47dc1b64080d8f831a7b198e41898fcbb"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.2/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "f606c0cd2d0d50f8b801ca89881ea7d9cf6578d2589c10c11610f9ef2c0a7e74"
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
