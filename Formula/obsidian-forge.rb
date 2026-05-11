class ObsidianForge < Formula
  desc "Obsidian vault generator, automation daemon, and graph strengthener"
  homepage "https://github.com/epicsagas/obsidian-forge"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.6/obsidian-forge-aarch64-apple-darwin.tar.gz"
      sha256 "6cdc1c31d6d35493f1d50057fc1f3347f943c8a28a093790cce64bab92de681d"
    end
    on_intel do
      url "https://github.com/epicsagas/obsidian-forge/releases/download/v0.1.6/obsidian-forge-x86_64-apple-darwin.tar.gz"
      sha256 "10c594d7419ef4cfb8124e8b5b940086924560ddf6095c3307614c91700b674d"
    end
  end

  def install
    bin.install "obsidian-forge"
    bin.install_symlink "obsidian-forge" => "of"
  end

  test do
    assert_match "obsidian-forge", shell_output("#{bin}/obsidian-forge --version 2>&1")
  end
end
