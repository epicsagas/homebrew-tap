class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.2/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "be1720ea20a39ec5beaa6ba9171af24889db76cfa41a00f224d3fb283eaeb37b"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.2/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "6293093793bfea005b16ee48932fcc98e884d25f17bc5eeef7f0dac75cae74a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.2/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "81fc483df7be8963003af87da72f7ce5f5dee73afaac05e2b350e8e3803a9120"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.2/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "2158cd81df229aa945621efa444cf127b28fe4769b9c5934d19ca84bca60d362"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
