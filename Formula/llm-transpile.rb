class LlmTranspile < Formula
  desc "High-performance LLM context bridge — token-optimized document transpiler"
  homepage "https://github.com/epicsagas/llm-transpile"
  version "0.4.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.5/llm-transpile-aarch64-apple-darwin.tar.xz"
      sha256 "08c735ff5ab6b4c29bf2beff6068ebcf623c3b49fb651f2cfc1c9b816a462bab"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.5/llm-transpile-x86_64-apple-darwin.tar.xz"
      sha256 "be23c5e7f2ea91d7b8a65ed3fe6c6ee482985c030aeca84d4752241caed04ae2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.5/llm-transpile-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "a6f444d239dd44c474c4bb8b94a37fa4f570b2a3dec86e4abe92b057d6eea57e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/llm-transpile/releases/download/v0.4.5/llm-transpile-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "adefd631f455dc8b0948bfa9d413003c56b1bcbbde7c822c0dc8a317b0dadece"
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
