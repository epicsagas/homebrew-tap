class Episteme < Formula
  desc "Knowledge graph for software engineering — design patterns, refactorings, and laws for AI agents"
  homepage "https://github.com/epicsagas/Episteme"
  version "0.3.15"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/Episteme/releases/download/v0.3.15/episteme-aarch64-apple-darwin.tar.xz"
    sha256 "6c8f09e8fa4abc4def5e1fb29c84694c42821f6e4d32287cdd2e184fd6b49677"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.15/episteme-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "568e0d887243c214a0997e5d756627d5188b40362ba94a174930586fce8cd878"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.15/episteme-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b8536a6cdcac5ec4c480df1621491383b18e70c9bea35f79c4f794bc3ca8c498"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "epis", "episteme"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "epis", "episteme"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "epis", "episteme"
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
