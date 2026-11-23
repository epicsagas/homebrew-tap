class Alcove < Formula
  desc "A quiet place for your project docs. MCP server that gives AI agents scoped access to private documentation."
  homepage "https://github.com/epicsagas/alcove"
  version "0.14.10"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/alcove/releases/download/v0.14.10/alcove-aarch64-apple-darwin.tar.xz"
    sha256 "06539b500e9c84dac9a338cb265330c45ef9dfd8fb4a30a230d1a9cee4fb0af1"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/alcove/releases/download/v0.14.10/alcove-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "73cb7481906a028c792244f7d200e8648d330a1cffc188534d21919e680728a7"
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":     {},
    "x86_64-unknown-linux-gnu": {},
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
      bin.install "alcove"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "alcove"
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
