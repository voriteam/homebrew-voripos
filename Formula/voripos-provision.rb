# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposProvision < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-provision/archive/refs/tags/0.9.0.tar.gz"
  version "0.9.0"
  sha256 "17ac4a7a03310e582ff2d127aaaf35a84a06fe65bb33baf60b6458b1eff7ceac"

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
