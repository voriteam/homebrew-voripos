# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposTxnSync < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-txn-sync/archive/refs/tags/0.6.0.tar.gz"
  version "0.6.0"
  sha256 "6fc256edadf7d673111d27c4ed4b1aa6b5b75df5e02e8a14826facac9519114b"

  depends_on "benbjohnson/litestream/litestream"
  depends_on "jq" # Needed for parsing API responses

  def install
    # Move everything under #{libexec}/
    libexec.install Dir["*"]

    # Then write executables under #{bin}/
    bin.write_exec_script (libexec/"voripos-txn-sync.sh")
  end

  service do
    run opt_bin/"voripos-txn-sync.sh"
    keep_alive true
    log_path opt_prefix/"var/log/voripos-txn-sync.log"
    error_log_path opt_prefix/"var/log/voripos-txn-sync.err.log"
  end
end
