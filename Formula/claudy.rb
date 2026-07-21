class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "dfe6acf3c828d75a909f5ac0e1095761d31b52a8a62e6f3f4412865829c412ab"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "91c93a641960707d849c33cb858ffb47a73a07cbb082d244e16185159ab11466"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.5.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c1fc400e8bd26b5057be1e025324c878fea241cd84e98f182c6a65d5cacfb05f"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
