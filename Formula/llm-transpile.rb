class LlmTranspile < Formula
  desc "Token-optimized document transpiler for LLM pipelines"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.4/transpile-aarch64-apple-darwin.tar.gz"
      sha256 "d0100181a186224a95abc686442a663505aae64144d2ebf5905fe28b51baa222"
    else
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.4/transpile-x86_64-apple-darwin.tar.gz"
      sha256 "8f1ba2cb6d2a04f7d4ef9a0833e443a54deebe3dab61c36d974fd841fe6d5f33"
    end
  end

  def install
    bin.install "transpile"
  end

  test do
    assert_match "transpile", shell_output("#{bin}/transpile --version 2>&1")
  end
end
