class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.8"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.8/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "b668eb5cef8b8f37c8281f0b721ad4f20f12ae21e5d840ded4926b72956f47e4"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.8/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "c1446071a8d396f60de340f2a8d458821c0ff0f52ab34cd6450816be4d1b981a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.8/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.8/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4ab0fe4fbdfbe1d8c2b4af8ebccf02df695a3f2814879b7713628fb540092406"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
