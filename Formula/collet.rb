class Collet < Formula
  desc "Relentless agentic coding orchestrator with zero-drop agent loops"
  homepage "https://github.com/epicsagas/collet"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/collet/releases/download/v0.1.0/collet-aarch64-apple-darwin.tar.gz"
      sha256 "b8a694291e984b278d1e7ae9be586d7b85884362d45b2c8ff5e038ac5a6181ce"
    else
      url "https://github.com/epicsagas/collet/releases/download/v0.1.0/collet-x86_64-apple-darwin.tar.gz"
      sha256 "f77e815f2b7a9bb18253486cd6a7f1bed1eaf801b84947f23396d00b7248e964"
    end
  end

  def install
    bin.install "collet"
  end

  test do
    assert_match "collet", shell_output("#{bin}/collet --version 2>&1")
  end
end
