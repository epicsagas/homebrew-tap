class Episteme < Formula
  desc "Knowledge graph for software engineering — design patterns, refactorings, and laws for AI agents"
  homepage "https://github.com/epicsagas/Episteme"
  version "0.3.7"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/Episteme/releases/download/v0.3.7/episteme-aarch64-apple-darwin.tar.xz"
    sha256 "c0edc9624aa54396f20c67479658087e91cb92a7f7a2cda7c633279fee188578"
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.7/episteme-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "227f4e9d089cd1e829219331d6a77644872785eb82dbfe680f43d50069faecbe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/Episteme/releases/download/v0.3.7/episteme-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "63e7e8c588b8ac102d024ec0681d3a2570b529b1ced8e08b36470d7f59e3ee1e"
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
