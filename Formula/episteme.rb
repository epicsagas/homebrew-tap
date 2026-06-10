class Episteme < Formula
  desc "Knowledge graph for software engineering — design patterns, refactorings, and laws for AI agents"
  homepage "https://github.com/epicsagas/Episteme"
  version "0.3.6"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/Episteme/releases/download/v0.3.6/episteme-aarch64-apple-darwin.tar.xz"
    sha256 "d81ac58e4e58f3d0daf7f6298fe89f537d81eb3bf72eb811d32c103552606bbb"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.6/episteme-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1316aa7ab80845750f59841f8a4c22d11da065b17133471e245a42b9cfecdc64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.6/episteme-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "cee96e178ddc115e0818a6356966f1a0fa8e08097e47426b107b3b1dcd9d60fe"
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
