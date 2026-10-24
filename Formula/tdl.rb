class Tdl < Formula
  desc "Tidal music downloader with TUI and GUI"
  homepage "https://github.com/epicsagas/tdl"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.2/tdl-aarch64-apple-darwin.tar.xz"
      sha256 "fd44dbab5c654563ebbb88361955f8207e4687fc422e11f81e2b77089091fc01"
    else
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.2/tdl-x86_64-apple-darwin.tar.xz"
      sha256 "deb4062341a031775680082ec8812db194a3549a2defb80ae2dc7f7280219976"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.2/tdl-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "8a00230df8e3445043912af8c03a65b041529f088f85c69b06cddeaebf0947b1"
    else
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.2/tdl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "122a8af923dedfb4a9b2314acc0d9e1181131b9e3cf31a7ab59270b969367e71"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
