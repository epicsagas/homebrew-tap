class Claudy < Formula
  desc "Tidal music downloader with TUI and GUI"
  homepage "https://github.com/epicsagas/tools"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-aarch64-apple-darwin.tar.xz"
      sha256 "5721462af72da82c7e82a0bd3d53536147e04cc87e5e4ab374e0a8f537f6b352"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-x86_64-apple-darwin.tar.xz"
      sha256 "535628fef3be6462304f70727caa69ad08a31fb70090097b4e11b6ff3105ea34"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "50ee66b3dc01f9fc983305003b06935c91f3a6a7c8d5b173c3d207d86e238733"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "b15305e2413ca7ad54c5ca10217c49dc73994f353ebef9b9a251d20b644740bf"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
