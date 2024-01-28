# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposProvision < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-provision/archive/refs/tags/0.14.0.tar.gz"
  version "0.14.0"
  sha256 "0546f15566535b4035e3ae9e3794fa10fc0cd7c55fdb957bc9788a922feee5c7"

  depends_on "coreutils" # Needed for base64 decoding
  depends_on "jq" # Needed for parsing API responses
  depends_on "voripos-otel-collector"
  depends_on "voripos-txn-sync"

  def install
    # Move everything under #{libexec}/
    libexec.install Dir["*"]

    # Then write executables under #{bin}/
    bin.write_exec_script (libexec/"voripos-provision.sh")
  end
end
