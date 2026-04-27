class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/tools"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v#{version}/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "REPLACE_SHA256_DARWIN_ARM64"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v#{version}/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "REPLACE_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v#{version}/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "REPLACE_SHA256_LINUX_ARM64"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v#{version}/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "REPLACE_SHA256_LINUX_AMD64"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
