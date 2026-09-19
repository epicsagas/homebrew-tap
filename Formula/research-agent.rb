class ResearchAgent < Formula
  desc "Long-term research assistant: index papers, articles, and PDFs"
  homepage "https://github.com/epicsagas/research-agent"
  version "0.2.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.6/research-agent-aarch64-apple-darwin.tar.xz"
      sha256 "5f722c9625f2b4bec948d2e6ef830e6906c14486e3987e2a62f654d54971a80b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.6/research-agent-x86_64-apple-darwin.tar.xz"
      sha256 "c5e42f4ba9c1d5cf82d8ca8c3eba939a89cc78ea4dbf0991175247806f461187"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.6/research-agent-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "4b435969a6c795e1b005dc0d322d64fd73e78bdbcbe5420038f52c4a1e89e3a3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.6/research-agent-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "60e7ea30421de3d95e3c5b4f50956d363a417ee52bb0f1939229151bde47d9c1"
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
