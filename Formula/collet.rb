class Collet < Formula
  desc "Relentless agentic coding orchestrator with zero-drop agent loops"
  homepage "https://github.com/epicsagas/collet"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/collet/releases/download/v0.1.0/collet-aarch64-apple-darwin.tar.gz"
      sha256 "b5b8a5f4cbdc10d4381b16d8c7bb1fc6aefaa00e9145cee6a38d021f5f671d5d"
    else
      url "https://github.com/epicsagas/collet/releases/download/v0.1.0/collet-x86_64-apple-darwin.tar.gz"
      sha256 "e6ec39136788a104b32fade35177b80135c405cdc512d668c016ea91c875d0e0"
    end
  end

  def install
    bin.install "collet"
  end

  test do
    assert_match "collet", shell_output("#{bin}/collet --version 2>&1")
  end
end
