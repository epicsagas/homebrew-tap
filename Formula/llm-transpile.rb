class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.1/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "003031ab49aeb253d46d9cf004e2dac06ffcba1777557919aeb9001cc99e54c7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.1/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "128ff90dd9628da6b25ccd8f97f6a760e486e7b016366ef3a7836beb05833434"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.1/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8d577e672bec702b546dd2f1b5a44cfbe8af92abbb54a829b7c1514a92fab102"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.1/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "133cb97b591f72022abc916aff666bc2f2c7b8dfaeced56f792bb809d3fde149"
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
