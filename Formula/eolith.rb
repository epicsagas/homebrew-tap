class Eolith < Formula
  desc "Local Mach-O disassembler (arm64-first) with .edb snapshot documents"
  homepage "https://github.com/epicsagas/eolith"
  version "0.1.0"
  if OS.mac?
    url "https://github.com/epicsagas/eolith/releases/download/v0.1.0/eolith-v0.1.0-macos-universal.tar.gz"
    sha256 "6f42a4faf73fe2f82d846e2c735e2140a85246641a52ca8b7eae8eda760b819d"
  elsif OS.linux?
    url "https://github.com/epicsagas/eolith/releases/download/v0.1.0/eolith-v0.1.0-linux-x86_64.tar.gz"
    sha256 "dd15d4fa6a721ab031b683580e544132a81edb408c69dfc6084c959d21665f7f"
  end

  def install
    bin.install "eolith"
  end
end
