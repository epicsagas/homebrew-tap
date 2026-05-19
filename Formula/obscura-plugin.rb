class ObscuraPlugin < Formula
  desc "MCP server for Obscura headless browser — CLI wrapper for AI agent integration"
  homepage "https://github.com/epicsagas/obscura-plugin"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.2/obscura-plugin-aarch64-apple-darwin.tar.xz"
      sha256 "6ece0f026f93d30a7224290baf205d73c53ad44b88f2c169345ee3949825ca11"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.2/obscura-plugin-x86_64-apple-darwin.tar.xz"
      sha256 "64c1a2c175f493aa9fc2e99a9e6a29e36f024f5957554f6e8b717e8bf062aba7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.2/obscura-plugin-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "07f2789760eba0164ba0735fc3e6747162abf4df414461612370fc569773e588"
    else
      url "https://github.com/epicsagas/obscura-plugin/releases/download/v0.1.2/obscura-plugin-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "29efe1f32a76d2c279b52d233a85e124c8a4cfe5da313250a789fa690c8e3276"
    end
  end

  def install
    bin.install "obscura-plugin"
  end

  test do
    assert_match "obscura-plugin", shell_output("#{bin}/obscura-plugin --version 2>&1")
  end
end
