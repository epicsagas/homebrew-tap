class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "843559eed451cac884bc357ad9b0bf3d3da3eca1c595f5d35ffb21e641e928a6"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "6866c2e206208da30c14979a074101c0f87d40a7895fad883510682cad4d91f8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "3d1ad16527e34efdc5d33d683451a0889796d467759e594c70aad03ab659a208"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b833fdba561846bef20b02e7b1ea61cb408fce6413de4f5b0dd980af1bbce296"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
