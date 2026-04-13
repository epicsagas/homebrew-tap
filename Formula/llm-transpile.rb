class LlmTranspile < Formula
  desc "Token-optimized document transpiler for LLM pipelines"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.2/transpile-aarch64-apple-darwin.tar.gz"
      sha256 "ddbb73d01c122f7d3c36bddc4bd53e41e68b873ca0c61bb44820b7d38757fff7"
    else
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.2/transpile-x86_64-apple-darwin.tar.gz"
      sha256 "3c63d1d4520acfdc2394b023390691119cbb3b736fe2bf287deb50483c2fd2ee"
    end
  end

  def install
    bin.install "transpile"
  end

  test do
    assert_match "transpile", shell_output("#{bin}/transpile --version 2>&1")
  end
end
