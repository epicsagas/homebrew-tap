class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.0/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "89e14d392aee0b0f752b5790c5dbb161f0ad55043c42a881edbc677337c260b1"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.0/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "deacdedc77eeebcfb15184bd6ec80d0a27ed1c9c8e1c84d07b278a2500fbad75"
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
