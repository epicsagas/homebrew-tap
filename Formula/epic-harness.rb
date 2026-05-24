class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.4.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.4/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "e1a01c2c2c3a32dd1889e6ddaae7bcb8224b51864e239a40254729a57ca7a4ae"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.4.4/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "a546800f8d107c10f01d6551bd6041839d78b4777db3f6acd6a8a97501c62f72"
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
