# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposProvision < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-provision/archive/refs/tags/0.10.0.tar.gz"
  version "0.10.0"
  sha256 "8df0df89a94df4a4f63f8b4ac5422a33b1b469c650e161c942809e5b00b3b5a3"

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
