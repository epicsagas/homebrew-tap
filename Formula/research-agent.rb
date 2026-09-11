class ResearchAgent < Formula
  desc "Long-term research assistant: index papers, articles, and PDFs"
  homepage "https://github.com/epicsagas/research-agent"
  version "0.2.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-aarch64-apple-darwin.tar.xz"
      sha256 "b57684585c8e87923885f1870fb9fb451afa38d57ce3d7b1188522e4012feae5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-x86_64-apple-darwin.tar.xz"
      sha256 "9ab75d6ad0f53e42af29dc892ec33df418fa6e3513e6c86203370c737dd67fc2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "9347d542c132389b6c26c9e6823cca4166974149ed015534a746a85bbcd14a33"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/research-agent/releases/download/v0.2.0/research-agent-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3764c9fcdc250504700f69ea396561da2ef73489946c1945ef26323a1d7b4d64"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin": {},
    "aarch64-unknown-linux-gnu": {},
    "x86_64-apple-darwin": {},
    "x86_64-pc-windows-gnu": {},
    "x86_64-unknown-linux-gnu": {}
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
