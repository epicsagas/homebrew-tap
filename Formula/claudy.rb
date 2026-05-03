class Claudy < Formula
  desc "Modern multi-provider launcher for Claude CLI"
  homepage "https://github.com/epicsagas/tools"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.2.0/claudy-aarch64-apple-darwin.tar.xz"
      sha256 "df4684de34dbb08be15b6585b83e51a2f8afed26ec1c5737621f8c46e3acf83f"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.2.0/claudy-x86_64-apple-darwin.tar.xz"
      sha256 "0c6849e2c12cb1fe2b50bee2252cd1503ff596243740bd98b234b56ae63c9d9e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.2.0/claudy-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "2f3e2a22034907a099ce9ec77510d8de4a8d18e7007559113429d184271c01f0"
    else
      url "https://github.com/epicsagas/tools/releases/download/claudy-v0.2.0/claudy-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "35731fb6dbc597cb0256d304d1a503e99095529cb1c4baea7d4978c424275128"
    end
  end

  def install
    bin.install "claudy"
  end

  test do
    assert_match "claudy", shell_output("#{bin}/claudy --version 2>&1")
  end
end
