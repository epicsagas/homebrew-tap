class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.5/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "de4940f4e4ef6bbe5886ae7aba5b9c0e7d266b57e3dd49b21889ff6eb54841ba"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.5/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "c821a74013b17dd0d68b72126402ba450a816388571264b230718b5a1ecab98f"
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
