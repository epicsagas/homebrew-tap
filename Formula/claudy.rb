class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.5/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "462ee8d3adf93af52d4f6f9c40937efe19540b71370c51c3b37afd72f725c1fc"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.5/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "3c72d0811978e24f1e42f5d77dcb660b26faed611b1778aeb52bf028ab02c3f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.5/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.5/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3b29fd73df69de785c43523f98d62d46539e8ca0233b03131de7fc4fe34d32b3"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
