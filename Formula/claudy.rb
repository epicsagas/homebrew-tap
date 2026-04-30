class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/tools"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "4e88b662e5ab23b936a60b70be03d7cfa78f65fa820c411edcc0ca248939609a"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "86f6d2702a92b3b548dae8ee14493c940020bd0d00497884c4d1562577ba36c0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "b49a39f3008021c856905dc31454dddb0a41c1d2782666dc94ca472b222e43ca"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.1.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "1e08d2a4a8be4cb8575a2fcbc522b022845e024829cfb07e7992df71a85d7fe6"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
