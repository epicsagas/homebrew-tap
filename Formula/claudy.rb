class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "c7213b577451b2277a3f428ea55e7493345f43b2073b5b6f3924723b8bc5c505"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "25cda47f32166e83d1212a070aa9e3cc5d8ee9321592812065b7085c19493f30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c763421c4ed6ff8d55e172c81f7b9bb568c37d1d32b4de00ff3e30f20aa24641"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
