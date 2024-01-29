# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposTxnSync < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-txn-sync/archive/refs/tags/0.5.0.tar.gz"
  version "0.5.0"
  sha256 "27a37d445d67ffb4ca7deb82a8a76c47ed118e2bd8909e834359ad821b7147d4"

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
