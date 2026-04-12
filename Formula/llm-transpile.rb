class LlmTranspile < Formula
  desc "Token-optimized document transpiler for LLM pipelines"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.0/transpile-aarch64-apple-darwin.tar.gz"
      sha256 "92c6992c2a0a75bf11533eaca3c9088c87f693d1ee3d012469df3352d789381f"
    else
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.0/transpile-x86_64-apple-darwin.tar.gz"
      sha256 "12c2fd5602945d6bae51fd572c6b83786fdcbc134815a7233977216f6ac6feb8"
    end
  end

  def install
    bin.install "transpile"
  end

  test do
    assert_match "transpile", shell_output("#{bin}/transpile --version 2>&1")
  end
end
