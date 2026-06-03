class Alcove < Formula
  desc "A quiet place for your project docs. MCP server that gives AI agents scoped access to private documentation."
  homepage "https://github.com/epicsagas/alcove"
  version "0.11.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.6/alcove-aarch64-apple-darwin.tar.xz"
      sha256 "ff3992644b1c8825c21647fef201a088d5125940902901b2eabd2767574bd956"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.6/alcove-x86_64-apple-darwin.tar.xz"
      sha256 "aeb5b62d6264c3a74f2089d32f61b7d3804e3d96150f2218d0ffa0e31951b60b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.6/alcove-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "f8bf293d0bbe8217fa8c6cab51022bfaab6c4851ad5390ab75703e12a5a7d914"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.6/alcove-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "46d6b12870eb9c5f7f0ac253d99b0ad4012fba2ed9ed1a7fb7fd6f613bf48391"
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
