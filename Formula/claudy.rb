class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/claudy"
  version "0.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.2/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "6256ff402904cfebaa8b8f1da5f64828d4d39c08a59d4561d5c25a422f361972"
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.2/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "7ef3238dd7b174db3b581a986aae27780747d71c40def2be6bd18de740d2fc0c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.2/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 ""
    else
      url "https://github.com/epicsagas/claudy/releases/download/v0.3.2/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5552b22f63c5e345c02599744fc9937db89076bce9de31317e2d932b254f706c"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
