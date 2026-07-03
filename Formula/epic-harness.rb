class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.1/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "62650835d0f669059d7f952b6899bf367b909007504969393a4599ed8dda6a5d"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.1/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "3488d97b1523345e284f2ec06a286378ab127d13134324499f36241d14150898"
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
