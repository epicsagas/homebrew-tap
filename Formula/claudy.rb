class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.9.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.2/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "cef9c8075c3f9a4dfd801616b16fe454763174f7b885db3d378467e355a50dcd"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.2/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "086c62bc37ffd8ef85f757fb01a24b9c41eafba5e9e91fcd9660b458838a4dc4"
    end
  end

  on_linux do
      url "https://github.com/epicsagas/claudy/releases/download/v0.9.2/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7f72e818115d9063bb47a53d9c3e5e0a97f8bb5828075a0e57a78c56aa3d528b"
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
