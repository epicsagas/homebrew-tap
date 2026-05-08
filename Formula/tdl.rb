class Tdl < Formula
  desc "Tidal music downloader with TUI and GUI"
  homepage "https://github.com/epicsagas/tdl"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.1/tdl-aarch64-apple-darwin.tar.xz"
      sha256 "1a1c0b20973ccac15216fed2a2c286aad3f702f9f0327869aac385f35486f3fc"
    else
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.1/tdl-x86_64-apple-darwin.tar.xz"
      sha256 "624f87d4b30e0086358f2cd68ccbe84d57a742c7fe6c1b00f1ab92f56a570c9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.1/tdl-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "41bb482b0f9515b2c009cf47a751640f4b709369738b1cdbb1714b3cf5018a31"
    else
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.1/tdl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "0d0b2c503bfad65d40485f66467484fd7f373d9df2f8a2da0823b79ce1775f81"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
