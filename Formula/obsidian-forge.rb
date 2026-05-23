class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.4/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "08f2e14cf47b78b5cb97616334eed8b493e491a7ed01012d53c01be749601ddc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.4/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "398feb5b1b00ff60f2d66a68f4b9deedb2d5b292c61953fbaf40fd3e95390b06"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.4/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "74fe2cdd870cdf5e289c53d2085ceca9542a84f64d4651b5481a3a594091b3a9"
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
