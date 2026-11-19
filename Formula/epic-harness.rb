class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.9.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.2/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "c1023e45a231f1a69b0c57b80d3aeb4addb44637fc9b3304be87046645340919"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.2/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "1b277ab76312ffc94f9fb2cffc8a23db00dbd0ca4e508d15a1e5fb13de2ecc3a"
    end
  end

  def install
    bin.install "epic-harness"
    bin.install_symlink "epic-harness" => "epic"
  end

  test do
    assert_match "epic-harness", shell_output("#{bin}/epic version 2>&1")
  end
end
