class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/tools"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "5ca6bfc656f55f28c3d1ee25277b6b82efcd94989c5a1b66000a6fbd471cd3e6"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "55a282ae5fca80664e11340559aca815cd1ae4c9a80319d1e30ef01b90767c9c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0648325e5c96b69ab55104be94b837a2062c114e507711e17dac7fd8aa56cae7"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b8583709fb6062af4e5874a681c86bdd5d384b2276133bcbab157d97e28614b8"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
