class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.11/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "a87db4e92b24c2e2e3c5ecb370e2f17b13ca668ed0a5ac22f5f568b939f0558b"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.11/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "2bd88c79e97302358a6c5c83ec36708466d61781e3426f9adeee4148d4f50237"
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
