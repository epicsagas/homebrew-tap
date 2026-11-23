class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.9.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.4/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "a557230ee61e5daea3769e754d34642c599a810bc3cee29d5589fbd3020e5219"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.4/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "b0f87f734349e92d95677dde900e3e8733c38448c803a55205722891fe52421d"
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
