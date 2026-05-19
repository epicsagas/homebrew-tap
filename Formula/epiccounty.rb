class Epiccounty < Formula
  desc "Install and manage the epiccounty ecosystem"
  homepage "https://epiccounty.com"
  version "0.1.0"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epiccounty.com/releases/download/v0.1.0/epiccounty-aarch64-apple-darwin.tar.xz"
      sha256 "2be5ba0795105450029a6b8869a9ded5a963486ad93de91831a11fee1c634430"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/epiccounty.com/releases/download/v0.1.0/epiccounty-x86_64-apple-darwin.tar.xz"
      sha256 "58471d1c5aac929ca4b3e3d582f98e779f32f6047e3a89f90737d29bb937e5aa"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epiccounty.com/releases/download/v0.1.0/epiccounty-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "5361d2e69630bad8415f709717430f3096e9547aa4863f22d5232b58d3e3b887"
    end
    if Hardware::CPU.intel?
      url "https://github.com/epicsagas/epiccounty.com/releases/download/v0.1.0/epiccounty-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "870ed5d6886ee5f2db090a4d59a83527fe6ce6634a87b131a7e0397ba9aa01a9"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "aarch64-unknown-linux-gnu":         {},
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
    bin.install "epiccounty" if OS.mac? && Hardware::CPU.arm?
    bin.install "epiccounty" if OS.mac? && Hardware::CPU.intel?
    bin.install "epiccounty" if OS.linux? && Hardware::CPU.arm?
    bin.install "epiccounty" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
