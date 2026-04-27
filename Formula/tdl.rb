class Tdl < Formula
  desc "Tidal music downloader — tracks, albums, playlists, mixes, and videos"
  homepage "https://github.com/epicsagas/tools"
  version "0.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v#{version}/tdl_#{version}_darwin_arm64.tar.gz"
      sha256 "REPLACE_SHA256_DARWIN_ARM64"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v#{version}/tdl_#{version}_darwin_amd64.tar.gz"
      sha256 "REPLACE_SHA256_DARWIN_AMD64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/tdl-v#{version}/tdl_#{version}_linux_arm64.tar.gz"
      sha256 "REPLACE_SHA256_LINUX_ARM64"
    else
      url "https://github.com/epicsagas/tools/releases/download/tdl-v#{version}/tdl_#{version}_linux_amd64.tar.gz"
      sha256 "REPLACE_SHA256_LINUX_AMD64"
    end
  end

  def install
    bin.install "tdl"
  end

  test do
    assert_match "tdl", shell_output("#{bin}/tdl --version 2>&1")
  end
end
