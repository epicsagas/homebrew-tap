class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.2.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.3/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "292c88cef0491e0602b226f7cf07f80d84bb21cf6a59da7b28807b05ef7a7d84"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.3/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "385455f245c1463863d96993dff5d2dd278bc2782d20a9c6158bee1dc8b1446a"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.3/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5e1083c166bb81f6d5936a1e322bd9d2a9587a422e45dec467391bc6ae4f524b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.2.3/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "facf530efb3f7372f5ce792637c72c445ef0021e1d03990e62363ccb3950a17d"
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
