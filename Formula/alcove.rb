class Alcove < Formula
  desc "A quiet place for your project docs. MCP server that gives AI agents scoped access to private documentation."
  homepage "https://github.com/epicsagas/alcove"
  version "0.11.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.5/alcove-aarch64-apple-darwin.tar.xz"
      sha256 "d4bf784aa29a94993ddd23e374856aa0cd2310d807dae302e333a1f95aea40f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.5/alcove-x86_64-apple-darwin.tar.xz"
      sha256 "e82463850a699732606cda2bfafcc3ed552ad825875743a533cfc2b6c1f48796"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.5/alcove-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "7a37c1ec6d64e7be7b18cd7a54644f5989633c74626de1cb80e7dd0c10b982e8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.5/alcove-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0b31c36d9305479fbe106ae02fb813a69d233b1c9b361909f540957919a69246"
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
