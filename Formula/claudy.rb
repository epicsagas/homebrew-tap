class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.4.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "746a36a27ad540312019a34ce1ebe92139efdca17cbcfe73bc1ee989b222ab1a"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.4.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "3604529736d428e48c9d5122a77eefb39090307c227779f84c7dc661059f77ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.4.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.4.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "217673ee30a2778417b7b1ef001b22f380133a1d464cbece0a1c99ddbedb03db"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
