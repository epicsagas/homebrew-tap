class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.3.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.3.2/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "a29641926ef0eca3bdf5f38dbcaa006ba27aebff38af16d36317cb81ef9f6d96"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.3.2/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "c198f6da77fbe28038e16d56e232fb04b072c7e71a14be8cccf34065fdf68bc7"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.3.2/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7ba6436ed29526c709f3545aa78824c0eba06efe842179f5a0c1a766de0b3169"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.3.2/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "352dbfe3d06c3ca0a01300820722264b1e51594bb1938aa87641505f64873988"
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
