class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.0/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "33e251167aea816e7da0c16b8cd71bb93103fdccaee89e9bcaf6f71ce4156509"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.0/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "a0adc9981a5f1c2df6fb8bacf847e5d1132dd810dfd92240d11be514aa161299"
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
