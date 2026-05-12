class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.10/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "18b0207cda21906ec3215fa81c6a8fafa3ef06bf24e157cde211be7d27b0430e"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.10/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "ab57e2a2e35bd383840fb0726f02bfffd44dc239802eada66b567cbac410b609"
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
