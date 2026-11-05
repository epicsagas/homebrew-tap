class Alcove < Formula
  desc "A quiet place for your project docs. MCP server that gives AI agents scoped access to private documentation."
  homepage "https://github.com/epicsagas/alcove"
  version "0.14.6"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/alcove/releases/download/v0.14.6/alcove-aarch64-apple-darwin.tar.xz"
    sha256 "faabd9154425d3c2f41b81596f22230e785a393a07685721b1acf57d48e05733"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/alcove/releases/download/v0.14.6/alcove-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "be281da132db0d68ab17e3e24039ce52888dca07167b91a6a11a4849c05b0c3c"
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
