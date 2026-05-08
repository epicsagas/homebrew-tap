class LlmTranspile < Formula
  desc "Token-optimized document transpiler for LLM pipelines"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.0/transpile-aarch64-apple-darwin.tar.gz"
      sha256 "c511ed3364b1e68d92854732b3950642c995732d1ac4ff00e3da62c0bd931e0f"
    else
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.0/transpile-x86_64-apple-darwin.tar.gz"
      sha256 "51301cc96fde619c8731395108ff04e835a32a6f69d148d3c653476120378f2a"
    end
  end

  def install
    bin.install "transpile"
  end

  test do
    assert_match "transpile", shell_output("#{bin}/transpile --version 2>&1")
  end
end
