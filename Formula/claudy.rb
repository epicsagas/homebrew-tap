class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "62d7296243ed0fe192da7aea45bb7fb994b1e780a62f2e7842f8e51edb22817a"
    else
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "af78e992da1c18bff54aed64fd94cb49e826cb8d12fdb6b99808c5773dc5c434"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "194385f182e69bbbddbbb535cf99112de74af7b1341472a6e7043c6e663e91c0"
    else
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.2.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b6420563c4eed6f88f70d9b593905b12add54aa190024f8c3231cf205fe0abaf"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
