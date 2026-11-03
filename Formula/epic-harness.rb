class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.13"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.13/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "dcd11025833ca096fbf64e59c82e91820bb8cf2c6072d635a8162f17d0a5b646"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.13/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "324f6cb9da748d1887c8ef1a2ed65faf886f5555e1e802338c7aab9e9aad8853"
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
