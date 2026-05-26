class Alcove < Formula
  desc "A quiet place for your project docs. MCP server that gives AI agents scoped access to private documentation."
  homepage "https://github.com/epicsagas/alcove"
  version "0.11.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.0/alcove-aarch64-apple-darwin.tar.xz"
      sha256 "279f2b3e51699bd05c286226135a96b55a2ab87c51c9bda0dd215cbe0f43ce5f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.0/alcove-x86_64-apple-darwin.tar.xz"
      sha256 "7ccae4ea7f8f47dc62df982c056ebde19da059e2e17b770be8d3df767f2c33b2"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.0/alcove-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "71cd0f0a7229075b2bbe9b24340a57f4fd496cf4c8776b5db3e4748a3e6c5716"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.0/alcove-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "9e16c3ff37ddda806bc1825f0c26b12f61fcdf95eca988fea81ba7221078d666"
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
    bin.install "alcove" if OS.mac? && Hardware::CPU.arm?
    bin.install "alcove" if OS.mac? && Hardware::CPU.intel?
    bin.install "alcove" if OS.linux? && Hardware::CPU.arm?
    bin.install "alcove" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
