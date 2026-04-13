class LlmTranspile < Formula
  desc "Token-optimized document transpiler for LLM pipelines"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.5/transpile-aarch64-apple-darwin.tar.gz"
      sha256 "2e6052551762ffad76f8d1f7606074c9f43a2bf2d5684b73600500e40c1b36e5"
    else
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.1.5/transpile-x86_64-apple-darwin.tar.gz"
      sha256 "53b707bdd6999d70d204cc88e9e8e7653fe1f66092da84e8f504c936c9b1e03e"
    end
  end

  def install
    bin.install "transpile"
  end

  test do
    assert_match "transpile", shell_output("#{bin}/transpile --version 2>&1")
  end
end
