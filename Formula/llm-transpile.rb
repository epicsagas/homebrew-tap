class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.2.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.2/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "eb09871f4908681b4ac0207e049a619c1eb20e01cae334df37a1d37331c4937b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.2/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "69953fb7f8797a15be17e34716a67a9190d5cfdaaa19dfe7cbc552a174d19d2d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.2/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "04fda7c2870768d1207faef59b1e0512cec433577e08466fe346069acca8d491"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.2/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "95fb1cfaa8d4a3113182c80dd1d89e196522927f347980d702a1d54c70b8cb42"
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
    bin.install "transpile" if OS.mac? && Hardware::CPU.arm?
    bin.install "transpile" if OS.mac? && Hardware::CPU.intel?
    bin.install "transpile" if OS.linux? && Hardware::CPU.arm?
    bin.install "transpile" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
