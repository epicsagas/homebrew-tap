class Tdl < Formula
  desc "Tidal music downloader with TUI and GUI"
  homepage "https://github.com/epicsagas/tdl"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.0/tdl-aarch64-apple-darwin.tar.xz"
      sha256 "7e22b0f7697c39c2c97d15c8dbc0e50074a7c1c33575cc4c1e98bfa5228edb54"
    else
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.0/tdl-x86_64-apple-darwin.tar.xz"
      sha256 "fffbefb8b28f13ca418fd5050d43a7ca14b6c9a687cd0ffeca7410ee1b09769d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.0/tdl-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "ad0698b89d88ff21b643b253ebb605eaa36429382d9b89e1930e37f63e8ad318"
    else
      url "https://github.com/epicsagas/tdl/releases/download/v0.1.0/tdl-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "21d1ac0232bb34169fcde4d4a5df18f674966e27c5a7b3fcecac184faac14b39"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
