class ObscuraPlugin < Formula
  desc "MCP server for Obscura headless browser — CLI wrapper for AI agent integration"
  homepage "https://github.com/epicsagas/obscura-plugin"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-mcp-aarch64-apple-darwin.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-mcp-x86_64-apple-darwin.tar.xz"
      sha256 ""
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-mcp-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-mcp-x86_64-unknown-linux-gnu.tar.xz"
      sha256 ""
    end
  end

  def install
    bin.install "obscura-mcp"
  end

  test do
    assert_match "obscura-mcp", shell_output("#{bin}/obscura-mcp --version 2>&1")
  end
end
