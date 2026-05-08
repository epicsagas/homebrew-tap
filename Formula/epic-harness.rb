class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 6 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.3.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.3/epic-harness-aarch64-apple-darwin.tar.gz"
      sha256 "53b2bb283b604f64fb845dd9420dae80480d716ccca079e75d84e4e8cfea5bd6"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.3.3/epic-harness-x86_64-apple-darwin.tar.gz"
      sha256 "070680590042412bdccc8bab5382bf4b5b60d76c265f75a85b1f36c1c3b72121"
    end
  end

  def install
    bin.install "epic-harness"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic-harness version 2>&1")
  end
end
