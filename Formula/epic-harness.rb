class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.8/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "1fdabbccfec5d269698c38fef827d6946241a6af160a66da8e4335b8ebb90116"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.8/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "75092e0900d2025beeda5455da0e46f9c66b31fe2cbdfa49154e7bb02c790c3a"
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
