class Episteme < Formula
  desc "Knowledge graph for software engineering — design patterns, refactorings, and laws for AI agents"
  homepage "https://github.com/epicsagas/Episteme"
  version "0.3.0"
  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/Episteme/releases/download/v0.3.0/episteme-aarch64-apple-darwin.tar.xz"
    sha256 "d6aa26da8b59c246be25bbd4bb6dbceab926328f9fadb9f8b3bbe4e6b2e01e7b"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/Episteme/releases/download/v0.3.0/episteme-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "d65581e5a872cc14cd4cead089c7703aa2d1da16576098efe102ba4beaa7314f"
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
    bin.install "epis", "episteme" if OS.mac? && Hardware::CPU.arm?
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
