# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposProvision < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-provision/archive/refs/tags/0.6.0.tar.gz"
  version "0.6.0"
  sha256 "fdef3fd40531c7fd9f70417017ae1a89bc4912b81f4f876c60e748c46b3eae37"

  depends_on "coreutils" # Needed for base64 decoding
  depends_on "jq" # Needed for parsing API responses
  depends_on "voripos-domain-sync"
  depends_on "voripos-otel-collector"
  depends_on "voripos-txn-sync"

  def install
    # Move everything under #{libexec}/
    libexec.install Dir["*"]

    # Then write executables under #{bin}/
    bin.write_exec_script (libexec/"voripos-provision.sh")
  end
end
