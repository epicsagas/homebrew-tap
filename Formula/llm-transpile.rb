class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.4.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.6/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "3bdc82a5da8f6e0dc984d941c0a1de33d3002c13faf722921ea8beb19eb1030e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.6/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "487c3580eecd079cbcad113c93faf240a88981283298f549bae836cabf0eb5a3"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.6/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "895a26ac76524d7fc21ae7511e6d91bab9db3cc81493ce6ba2c979b66ae675b5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.6/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "d4e71caa9bfb0dc972c4d71c4ea7945aaaa121ff3a571fdac040e28bb7155ee4"
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
