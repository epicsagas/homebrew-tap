class LlmTranspile < Formula
  desc "Token-optimized document transpiler for LLM pipelines"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.3/transpile-aarch64-apple-darwin.tar.gz"
      sha256 "25eada83bc54a25910c90680c7003d37e20fbf8d4d8a8e6ee2acdb487878eef3"
    else
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.3/transpile-x86_64-apple-darwin.tar.gz"
      sha256 "6997c93d3c9877be1c2a649809067ec9cc0a8a164c3b9cfb23a80937805c8cc0"
    end
  end

  def install
    bin.install "transpile"
  end

  test do
    assert_match "transpile", shell_output("#{bin}/transpile --version 2>&1")
  end
end
