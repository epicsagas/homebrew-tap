class Alcove < Formula
  desc "A quiet place for your project docs. MCP server that gives AI agents scoped access to private documentation."
  homepage "https://github.com/epicsagas/alcove"
  version "0.11.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.2/alcove-aarch64-apple-darwin.tar.xz"
      sha256 "e454010945ca129abeea6481ea686a3fb533f07aeafabff554f96332e58a6bb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.2/alcove-x86_64-apple-darwin.tar.xz"
      sha256 "d3279883accb9ed3c42549c891489634fb7ec50ee7a8c88d35fcd10468c9f661"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.2/alcove-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "09bc1860b7da5642d24c46ccc4c1d1423b9498f382b9e65ec8e82c6d6ada8e1f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/alcove/releases/download/v0.11.2/alcove-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "eda76712569e9c9cc2816484f09c44b3d2eda5fbad1a4756128515e5bb33944a"
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
