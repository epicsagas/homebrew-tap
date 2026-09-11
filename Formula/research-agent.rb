class ResearchAgent < Formula
  desc "Long-term research assistant: index papers, articles, and PDFs"
  homepage "https://github.com/epicsagas/research-agent"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-aarch64-apple-darwin.tar.xz"
      sha256 "d5dd382e00890a0c4e77dd0b7f6986373fd255be5dc33f186985e3f0088a8496"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-x86_64-apple-darwin.tar.xz"
      sha256 "a6bb9b2a0c40e1c73b699ecaee10dcecf4e1ac83bf121a81b333f058a8f1389f"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "77a590c3fa5a83536ca47f339d807ac607dc6def59c6ba76049bfdbb6d72ddae"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "57c75f0cd487d26bf03431de3ac54af590aa939ea16ec49d4474253be1eb3081"
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
