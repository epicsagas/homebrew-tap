class SeqtrakAgent < Formula
  desc "Unofficial CLI, MCP server and web GUI for the Yamaha SEQTRAK"
  homepage "https://github.com/epicsagas/seqtrak-agent"
  version "0.1.0"
  license "Apache-2.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/seqtrak-agent/releases/download/v0.1.0/seqtrak-agent-aarch64-apple-darwin.tar.gz"
    sha256 "a05da0545a66e8bbcd758664371797287d3c831c35802ce198f94e83427ee721"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/seqtrak-agent/releases/download/v0.1.0/seqtrak-agent-x86_64-apple-darwin.tar.gz"
    sha256 "cf3fd8624d89836271bab08c9e7abcef00b3e8cc836869d1ff497bf9158c4430"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/epicsagas/seqtrak-agent/releases/download/v0.1.0/seqtrak-agent-x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6fbe096b13dad29f03cfdb17ce4ac6506d44fa6329ff46ec336911853f9850df"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/epicsagas/seqtrak-agent/releases/download/v0.1.0/seqtrak-agent-aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c9305486aced420c529d373f63aca7cea9823584970d8103af0c1956e5a67f02"
  end

  def install
    bin.install "st", "st-mcp"
    (pkgshare/"gui").install Dir["gui/*"]
  end

  test do
    assert_match "st #{version}", shell_output("#{bin}/st --version")
  end
end
