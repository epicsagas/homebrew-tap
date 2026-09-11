class ResearchAgent < Formula
  desc "Long-term research assistant: index papers, articles, and PDFs"
  homepage "https://github.com/epicsagas/research-agent"
  version "0.2.1"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.1/research-agent-aarch64-apple-darwin.tar.xz"
      sha256 "c22cc525aa2d70b1d2c636a3b6921ca8d1a60e02fa2e878441faa56b8c3f7a64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.1/research-agent-x86_64-apple-darwin.tar.xz"
      sha256 "0e7a75ec9898ef744c405f122faf9860f9f851ea25f5110fb9dcc2ef82eeae51"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.1/research-agent-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ae27a861f0652f20b476160d2520665a95c2c16c465772d9b105dcf05646667e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.1/research-agent-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "4eaab9a283d629bdfb28a8787886b3af1df409b9ca9b6440bf5bf43e799c7978"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":      {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin":       {},
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
    if OS.mac? && Hardware::CPU.arm?
      bin.install "research"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "research"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "research"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "research"
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
