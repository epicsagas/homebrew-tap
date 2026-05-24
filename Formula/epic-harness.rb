class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.3/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "d38c7459dedc75ced0b3c210126192a33ce2661fe0af99725b1db9aabcbb97e4"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.3/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "e8b64e4760d4e2b436fe5bcc714074489d692fd6c2c991e56999c83ad85aa939"
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
