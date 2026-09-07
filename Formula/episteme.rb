class Episteme < Formula
  desc "Knowledge graph for software engineering — design patterns, refactorings, and laws for AI agents"
  homepage "https://github.com/epicsagas/Episteme"
  version "0.3.11"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/Episteme/releases/download/v0.3.11/episteme-aarch64-apple-darwin.tar.xz"
    sha256 "086d1dd00fe0bedd8b42af7aa761db9cf83fe59e250dfafdd6c5bfd104c9be29"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.11/episteme-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "688889db436ac5e924f9c72d636160382d086a9fb330966764946b7af647b9ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.11/episteme-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "249deb9a830a2f6cfdb38ed982f90b8e947da624032358ff2d3caa4953bf1997"
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
