class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "b0fc5a0576bb484dd195e8416e76be7768d1bcd13769a59185e1576b5478698f"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "77d1a3aeb5f0c252445c0dbcddf9b3b45902768293ef4fa8ea1e0708bcc35fd9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "d8acabd190ce25a8886e747b6a19724690b4a7abe5632a95dd3ac439f4540f0b"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7c1b7cb8475bfe976f3dbb548871dfe26ebb96f71714a560d1c6a24e1409ae83"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
