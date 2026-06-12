class Episteme < Formula
  desc "Knowledge graph for software engineering — design patterns, refactorings, and laws for AI agents"
  homepage "https://github.com/epicsagas/Episteme"
  version "0.3.9"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/Episteme/releases/download/v0.3.9/episteme-aarch64-apple-darwin.tar.xz"
    sha256 "5a433d5adbb7e2eba2904d60db03cb5dd04446e37ca86d35cd2ade69e57b7d4a"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.9/episteme-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "c243b5314662f7558b2bf173a98a71c12e5b1e75315b23a74b182c4b82dcfee8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.9/episteme-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0ee746c3565fd632e08108e0de2dbbdca4711c7428b1fdd92e17e04dba49b8d5"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
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
    bin.install "epis", "episteme" if OS.mac? && Hardware::CPU.arm?
    bin.install "epis", "episteme" if OS.linux? && Hardware::CPU.arm?
    bin.install "epis", "episteme" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
