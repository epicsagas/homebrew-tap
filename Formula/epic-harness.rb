class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.7.0/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "df062854e77c76e5d980ede64918c12d9997e7e3dd03b714b0270521cc013f54"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.7.0/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "cef8666df6687653c54d1f21e22420031e52d19c87f96f8028be9d0580b341a0"
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
