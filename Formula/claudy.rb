class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.3/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "bee6448b6cfc6a8a079f53af7b2f1b5bb83fe07ffd9389c70f36d89139bbb6e5"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.3/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "88a2009c267ca033a457d686ad5c4e18bac4145ce7c0df902119899e168bfeec"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.3/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a4a4cbf4bb7e31271cafcd163baef1b7cc329a00927e09982fd86be26d3df8ad"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.2.3/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "e7fb577c37683589876a8c125451e5f63624a82eff2a1a03e845f58455534f17"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
