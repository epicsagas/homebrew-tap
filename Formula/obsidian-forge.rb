class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.1.8"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.8/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "44efc41e1cddc91f9111f295ba24d65afb89947f928fd8d8983a29a59674f5d4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.8/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "684af5295a0c271f6f633fada69e4b949160cd46c163f82c7dc6a25e78bf2a97"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.8/obsidian-forge-aarch64-unknown-linux-musl.tar.xz"
      sha256 "dfaf2643a7a00d05af702e8b199a5a01e89bc58360c8ee34bf027c556db6b54d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.8/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4a7f9712ab527eed1f6ddf4f6f868a516d2759272bc2ae623124d83ea00cc4f3"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-pc-windows-gnu":              {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
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
    bin.install "obsidian-forge", "of" if OS.linux? && Hardware::CPU.arm?
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
