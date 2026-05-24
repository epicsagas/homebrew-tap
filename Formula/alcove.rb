class Alcove < Formula
  desc "A quiet place for your project docs. MCP server that gives AI agents scoped access to private documentation."
  homepage "https://github.com/epicsagas/alcove"
  version "0.10.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.10.4/alcove-aarch64-apple-darwin.tar.xz"
      sha256 "7096282873864e824e238408d59a5725b0eb84061f39517ecae510c9b4fb24fc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.10.4/alcove-x86_64-apple-darwin.tar.xz"
      sha256 "86549c3cdbb5969ce7cd27e34c1d2191c72df8ff13638e358c6ac120f5239ee7"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.10.4/alcove-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c1d2488e8ebdc76244a0decaee4ac5aa052188081b52a653652316f864754a8f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.10.4/alcove-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "666cf9e9d894412c7f9e12bfa4565786329e3697a733b25811c7da26973bc121"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
    "x86_64-pc-windows-gnu":     {},
    "x86_64-unknown-linux-gnu":  {},
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
    bin.install "alcove" if OS.mac? && Hardware::CPU.arm?
    bin.install "alcove" if OS.mac? && Hardware::CPU.intel?
    bin.install "alcove" if OS.linux? && Hardware::CPU.arm?
    bin.install "alcove" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
