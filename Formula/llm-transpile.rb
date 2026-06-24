class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.4.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.1/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "688570c3fbcabb67c43b0a4ffdb5c926528280255cb19864982bf40f2ab68178"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.1/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "5ecdffc834d9c138dadc3abd48fdc1ae977cf2dd9b2ffab4d7fa226cc5de1ef9"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.1/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f76e2e442db5ee742f65118c06731a53a8a3dfc0a03afc569b6586b7bfce7336"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.1/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6323c0a6335e52c6f3a6cc42f61457f47ca0a9d920e7cc50b986c1cd3c71a4fe"
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
