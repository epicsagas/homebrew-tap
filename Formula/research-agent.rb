class ResearchAgent < Formula
  desc "Long-term research assistant: index papers, articles, and PDFs"
  homepage "https://github.com/epicsagas/research-agent"
  version "0.2.4"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.4/research-agent-aarch64-apple-darwin.tar.xz"
      sha256 "e35d2718a0fc835cadf51cdc3dd7c2ad4c25c55c19de3eefeac8e60e1259865e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.4/research-agent-x86_64-apple-darwin.tar.xz"
      sha256 "3c7bc9cf36de66f3c26de4da40d2d4e7cd467de0585654e3e8744779c55090b7"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.4/research-agent-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dfaefce0e5a47a3b4c7ba054313850218bdd779b4f30d6ed3800f3dd3240ab51"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.4/research-agent-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b8eae476d5fce4ebe53ed21464d07e48fe1699e82bc5446755e0b27637612f6b"
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
