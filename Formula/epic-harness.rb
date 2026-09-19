class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.7"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.7/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "86795dccec6feebf987c6395f1d295d68fb6647c8f3b06e7f6cbb60892ec54ff"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.7/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "02560df117a92dcf460b7a4736c8e447fdea96858b761668208b01aed98f15a4"
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
