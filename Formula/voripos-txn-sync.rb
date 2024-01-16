# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposTxnSync < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-txn-sync/archive/refs/tags/0.4.1.tar.gz"
  version "0.4.1"
  sha256 "adb8029ebc3bed469843ecd08ac7923233d497d83452dddca5d1ec490b41c343"

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
