class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.10/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "30b77e38ecadc9d286e282bf7bbe2b99b3082ed8fb2f7d79650b5e9210dcca1a"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.10/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "3b9affe4d9c2942eed3102366df40e2427efdfac52f4d709a8029ea7a66ed962"
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
