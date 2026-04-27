class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/tools"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.1.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "26d2e86a384969d97362b5bf641d53167f56b2a92e72c8f5c87c716a886ccc30"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.1.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "224c0372f8e1ac845f19c838526456c0152dfcaacc82c4f3d861e49cec051912"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.1.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "dd90520294fdbbc9781ab65092babcd7b0968ba09ec7aba7a18f1aa92c1916a8"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/claudy/releases/download/claudy-v0.1.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "72f9f33c3bba28d7b7ed901bff4b634f6b8374cbd9b591ad2e2fb55fc076a010"
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
    bin.install "claudy" if OS.mac? && Hardware::CPU.arm?
    bin.install "claudy" if OS.mac? && Hardware::CPU.intel?
    bin.install "claudy" if OS.linux? && Hardware::CPU.arm?
    bin.install "claudy" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
