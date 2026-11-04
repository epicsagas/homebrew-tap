class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.4.7"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.7/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "ee923f5d3f4881287eb7223a75767886035f0da888aff5e72ec041a806b7d5db"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.7/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "14dc87cec62d637a65f32837a6bf045e3091a2589fe088cf920c717cf978d05d"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.7/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a99370c022fb1db0d8cde6828ac424e5edd932a11ba62665c8d94cae5281ab77"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.7/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "c9f2bc295e220a38e2103c58212814baa1f039d0bc21d0f091abfeb7ccaa13dc"
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
