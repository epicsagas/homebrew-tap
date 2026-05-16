class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.0/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "6efcc0c4dcdc51788025f58c4587b8bbb396f052ecf23d9578f9fa6462902599"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.0/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "e8af1f67715c869769d1c604dd1e1570529818569900e6de7244d18e7391e0c6"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.0/obsidian-forge-aarch64-unknown-linux-musl.tar.xz"
      sha256 "751b39a5b8b3adba2977f289ee9311955e7a7f7bf1623a82839d1632e0d52565"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.0/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "13ada4d0065f8127f8f3438bde0cf750fe2ea1fa1a05dab3658fc60d6d0acbf7"
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
