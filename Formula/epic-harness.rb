class EpicHarness < Formula
  desc "Self-evolving Claude Code harness — 8 commands, auto skills"
  homepage "https://github.com/epicsagas/epic-harness"
  version "0.8.9"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.9/epic-harness-aarch64-apple-darwin.tar.xz"
      sha256 "f795a02ed19c503c31d9068b12223536100a6311a1cdf6f4bd7e49ce20a198a9"
    else
      url "https://github.com/epicsagas/epic-harness/releases/download/v0.8.9/epic-harness-x86_64-apple-darwin.tar.xz"
      sha256 "beab38281ad9fe3ab2e50d6e8c93185abf1d44666d5c1ad3e700a2a5134ba444"
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
