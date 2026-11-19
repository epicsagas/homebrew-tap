class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.9.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.3/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "4f6878f5c216447cb37a5b970cd36220249a9af7beba41c923b8929d12ad942d"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.3/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "1dc389db059f0ea80eb7f0777ef3f0b1d9ee52aa59e8319d1caaa79e3c6deb4a"
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
