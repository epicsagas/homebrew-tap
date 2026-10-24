class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.5.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.5.1/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "ef1385c19c49fcba0df8b1c9b23de09966cf8567097102ce636836d0c0a0d625"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.5.1/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "75d200c7d3d7d390114b8a396417eec7835a1866905d4a7a99eb1ba977dc520c"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.5.1/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "d32121144417e63ce680c9aac73d963bae1cd2aa048296855be1de100ad0df0a"
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "obsidian-forge", "of"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "obsidian-forge", "of"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "obsidian-forge", "of"
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
