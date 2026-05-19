class ObscuraPlugin < Formula
  desc "MCP server for Obscura headless browser — CLI wrapper for AI agent integration"
  homepage "https://github.com/epicsagas/obscura-plugin"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-plugin-aarch64-apple-darwin.tar.xz"
      sha256 "b4eeba251d2cdabaee8f9640023ae4afc4edf9d26d69d42bff6f44a9107a5213"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-plugin-x86_64-apple-darwin.tar.xz"
      sha256 "1136fd68dad38f8d95792c8e96f0b08e178ef698b79def434d95884e4723459a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-plugin-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b10195ba180be9ebab6857f003527be5e8a2c412fe1c0fbd944f83d29d247ec5"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.1/obscura-plugin-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "022ea4f92ccf57167107da6800b01da106823b5a667291bc2fd539e6aaeec90e"
    end
  end

  def install
    bin.install "obscura-mcp"
  end

  test do
    assert_match "obscura-mcp", shell_output("#{bin}/obscura-mcp --version 2>&1")
  end
end
