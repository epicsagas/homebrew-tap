class ObscuraPlugin < Formula
  desc "MCP server for Obscura headless browser — CLI wrapper for AI agent integration"
  homepage "https://github.com/epicsagas/obscura-plugin"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.0/obscura-plugin-aarch64-apple-darwin.tar.xz"
      sha256 "c22aaa423e3b2b3df9a1d97756aea15315e7c6e5d0f79141fd9143e3a4840f54"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.0/obscura-plugin-x86_64-apple-darwin.tar.xz"
      sha256 "f260641b5c41e140465901f2672ef444d1f0c586b8ddc392d1294a2050a90320"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.0/obscura-plugin-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8a3d0170844f631601b010433e214ad4dbc774f6c16f9819738ddff37c7a7302"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.0/obscura-plugin-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a22c5e87ba8b737c1d13b9bf69e95bafc40d49cd89f06a563ef82a69ddfd913f"
    end
  end

  def install
    bin.install "obscura-plugin"
  end

  test do
    assert_match "obscura-plugin", shell_output("#{bin}/obscura-plugin --version 2>&1")
  end
end
