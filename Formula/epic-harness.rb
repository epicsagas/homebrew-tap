class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.9.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.1/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "cb1fd32f8749390072f6fd79d796f7cc47b03273e1697d57ba26516d04c5bd91"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.9.1/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "5d1246fd634328c40f305706dcf501824e066939522137b8bf610f49e8c8752b"
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
