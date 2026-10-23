class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.11"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.11/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "9b5a4294737c80f679fc42e8ca19cb26b76eea604a42a937dd7793ead55fcc37"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.11/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "a24439d8ed701e9960de19e29c6b1c5760705c67eda25589f839acb55920674d"
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
