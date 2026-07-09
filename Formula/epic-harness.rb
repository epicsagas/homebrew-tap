class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.2/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "43d35d155d3d68f5cf08c4223ca92ac6859ab4d4fbac29c8ebfd8618dd1b2f94"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.2/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "454975201823cc8070c58d0a9364aa278793e0c530ed7cda40cfd120b8ec1fa0"
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
