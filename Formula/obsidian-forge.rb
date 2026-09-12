class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.5.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.5.0/obsidian-forge-aarch64-apple-darwin.tar.xz"
      sha256 "9171d5a471609151f0485c91e87998faf5c63507ff4a078351b4e8cba732739a"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.5.0/obsidian-forge-x86_64-apple-darwin.tar.xz"
      sha256 "3c4e2a84be46da85791f520207514d9392b86505bbdd7bf57f9cbaceb96e5c79"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.5.0/obsidian-forge-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "915b2e33466b33b80ae3e77489abeda401e70c9e8d44cdd2808e7cf56590d38a"
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
