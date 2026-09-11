class ObscuraPlugin < Formula
  desc "MCP server for Obscura headless browser — CLI wrapper for AI agent integration"
  homepage "https://github.com/epicsagas/obscura-plugin"
  version "0.2.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.3/obscura-plugin-aarch64-apple-darwin.tar.xz"
      sha256 "206cc7137242a20e2fa9d353741eaab6a2e64e190c880ced881981fceed5505e"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.3/obscura-plugin-x86_64-apple-darwin.tar.xz"
      sha256 "d5c916c44adf9a0302b64b769ddbc4b6f634589bb8a4d87578c52e59b89b9e80"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.3/obscura-plugin-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "06eb332342b82ed7f027afc4365c7dc4d392b2a8057aa999c23ee8b593819fa5"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.2.3/obscura-plugin-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5c224745b9b355a65e2162df8219e17293b4f77cf304156d5d44d19f3cbbe2f8"
    end
  end

  def install
    bin.install "obscura-plugin"
  end

  test do
    assert_match "obscura-plugin", shell_output("#{bin}/obscura-plugin --version 2>&1")
  end
end
