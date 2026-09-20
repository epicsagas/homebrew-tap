class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.4.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.4/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "8d1216ddebe0e35b4896188725b11e8904542251daa39e4f51eea0abd1c08b14"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.4/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "802eef600391514a6c366175dedd7daef6d9a54b345c7e4280c0f891fcf08d14"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.4/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "09a59ce2082c1dd54168cc56906d0b04c5bbd098277ce8885c9b2bc986f0aa51"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.4/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b3f8b417d51ef9a6ea90144dc1d04765c474bd0229fb681f3ff480476567e83d"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "transpile"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "transpile"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "transpile"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "transpile"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
