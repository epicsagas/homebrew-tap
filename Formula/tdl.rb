class Tdl < Formula
  desc "Tidal music downloader -- tracks, albums, playlists, mixes, and videos"
  homepage "https://github.com/epicsagas/tools"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.0/tdl_0.2.0_darwin_arm64.tar.gz"
      sha256 "6e8ed0d5e92f3a62ce123424312b5afdd2078928d8d10f36946469acd1e93aff"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.0/tdl_0.2.0_darwin_amd64.tar.gz"
      sha256 "3b5a73e2ff791997d9badcf94aa87d9ccfab095c299bf09b792c8ecf5c6c386b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.0/tdl_0.2.0_linux_arm64.tar.gz"
      sha256 "0da3864180a593b91765f24bdad6315ca0e655a3bc5c32a9809499c0c097dcd5"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v0.2.0/tdl_0.2.0_darwin_amd64.tar.gz"
      sha256 "3b5a73e2ff791997d9badcf94aa87d9ccfab095c299bf09b792c8ecf5c6c386b"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
