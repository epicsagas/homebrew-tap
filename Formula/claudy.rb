class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.8.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.1/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "a4a7fb8dc09da0d476ee1f23cb843bb05ff1cf915ae792f8157cdcd9808c9265"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.1/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "f5cb0d0564e3a8c0d71b96e4582ccbf3dabf03790ee04f0b68e1cd3326bef62b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.1/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.8.1/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "eaf2cb6ffacd9220e46d0607527f6eb5786f488b47ca2dcf020beea9e8317219"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
