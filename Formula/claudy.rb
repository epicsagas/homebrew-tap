class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.1/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "89883f1e731488e7cf7c078d855dc55a65a5ef017d53a09f719caea1d019fd00"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.1/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "cf0ac70b926f3f479f7d1af2764239bd70d9422185dc5c80abaf7ad64b7d66b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.1/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4b97955308a8f96f99eea9c98e55b976766eb13f9b25ba44f5f5ab7d05215015"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.1/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4767250f5c556249d9237d8d90a2c3f84762ba0369a690bf37705aa61ce83080"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
