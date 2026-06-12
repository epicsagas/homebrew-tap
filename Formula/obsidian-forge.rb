class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.2.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.5/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "9c040e185d560e1c5c0c2c01f92100c897534c674318ecb6f3d1924f40cce366"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.5/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "ff8654782484cd2b79fcbf76fec1e478002644ae1e2bd01efc54c9da81d6151e"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.5/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "d27917f9934fd99e8fb48b17bc454c9203fbf4b88eea64218c71d78216eaeaf5"
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-pc-windows-gnu":             {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
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
    bin.install "obsidian-forge", "of" if OS.mac? && Hardware::CPU.arm?
    bin.install "obsidian-forge", "of" if OS.mac? && Hardware::CPU.intel?
    bin.install "obsidian-forge", "of" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
