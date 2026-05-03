class Claudy < Formula
  desc "Tidal music downloader with TUI and GUI"
  homepage "https://github.com/epicsagas/tools"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-aarch64-apple-darwin.tar.xz"
      sha256 "02c692f4cf7a2b6c52a44f50f81d9792314470a333de72947c187abfae776c17"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-x86_64-apple-darwin.tar.xz"
      sha256 "e721937d35be0813680973e5dea773b9c739a954dbdbe437cb78abfd91acdbba"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "0ea374bdb4c6bef7ad47832a685bbfe1746343b6d9f0930b307b04ce8c59c339"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "00a822040c2d7ae1549f11c30077ffc28202b44f14b3523d744bbb9bcb6e9a9d"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
