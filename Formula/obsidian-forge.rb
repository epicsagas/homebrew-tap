class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.2.3"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.3/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "254fef7f99159136849cf02afa5f9d1adc60e43760a3e1d747eb2290b8163f92"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.3/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "bd45e65ba137409d3625248b6fd214b08b5fcfc556a74c1d45500530995bed1b"
    end
  end
  if OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.2.3/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9cd99a5d6b75010c8b8164c29b04bf26c0791db05331409ccee52ddec9e72393"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static": {}
  }

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
