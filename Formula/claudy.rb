class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.7/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "8f57589fb8ab3201e16645f2281c701fa9070aaf43f36a78968caf81ebf5df6b"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.7/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "6fd6490240c7c65c9d07eedf41c29c9927eed06f61f62555a4650a4878b00213"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.7/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.7/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0b3b98393651faae2e19a4e7bc2cdac3d47f4657990055595b5fcf6c355e0561"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
