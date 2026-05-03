class Tdl < Formula
  desc "Tidal music downloader -- tracks, albums, playlists, mixes, and videos"
  homepage "https://github.com/epicsagas/tools"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl_0.2.1_darwin_arm64.tar.gz"
      sha256 "628b5872660cb0ff5ee1ae1cabeb37d1c1076ce7e5022a6e98bcfb6b7b51b105"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl_0.2.1_darwin_amd64.tar.gz"
      sha256 "f97988fce93875b5b962357c6cd7b6a77c5d1fd479efcd2651540aa2c5556108"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl_0.2.1_linux_arm64.tar.gz"
      sha256 "82b660e88ea48423cd33dd8199a2e3e584c33ba305d35906ebd036af58336c8b"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.1/tdl_0.2.1_linux_amd64.tar.gz"
      sha256 "6884c975f0f415443d23f9514c8b56f7d0d64cc2a6cb5638225d193555333a41"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
