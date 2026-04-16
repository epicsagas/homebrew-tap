class Collet < Formula
  desc "Relentless agentic coding orchestrator with zero-drop agent loops"
  homepage "https://github.com/epicsagas/collet"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/collet/releases/download/v0.1.0/collet-aarch64-apple-darwin.tar.gz"
      sha256 "c42159a69314c165f609f6314265dbab6cb2de61302d73e258161488f52b4b85"
    else
      url "https://github.com/epicsagas/collet/releases/download/v0.1.0/collet-x86_64-apple-darwin.tar.gz"
      sha256 "f309c2b8ee11c8b2fb14560e384d3e8f222667e6c3d88509d6bf9fbe7bfe6287"
    end
  end

  def install
    bin.install "collet"
  end

  test do
    assert_match "collet", shell_output("#{bin}/collet --version 2>&1")
  end
end
