class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.4/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "0151febf9f81429afa7b427bbd8e46ab4a7c4c2a25ae68a68d8eaf1926ee7062"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.4/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "b1a32545ced84d288b2db6ef3a3785afca7946560dfcbb78cb9371c5051db3f8"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
