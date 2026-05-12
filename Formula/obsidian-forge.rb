class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.1.9"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.9/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "4d75ce511c8648ff0a8e2301f25344c577065ad6c7de3a7bbad9f02ad55d94fe"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.9/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "54d00aae648eff40e2cdb4a4acf1b018823cbe58ffd63bc5c66516779c1efe8b"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.9/obsidian-forge-aarch64-unknown-linux-musl.tar.xz"
      sha256 "4cf8608b1c31f89f0dc32c2020feb0b678609db9fe12c310c9eb56ab61684871"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.9/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "10d9e2a4932de8f2ee109cabef2775dffca50125f58b7725f945e24c8e95a0f8"
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
