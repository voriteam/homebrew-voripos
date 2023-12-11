# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposTxnSync < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-txn-sync/archive/refs/tags/0.2.0.tar.gz"
  version "0.2.0"
  sha256 "48ae4b3f3fbcfbe64d348d923a3d075a49d4112005e89cb05234845184fbe059"

  depends_on "benbjohnson/litestream/litestream"

  def install
    # Move everything under #{libexec}/
    libexec.install Dir["*"]

    # Then write executables under #{bin}/
    bin.write_exec_script (libexec/"voripos-txn-sync.sh")
  end

  service do
    run opt_bin/"voripos-txn-sync.sh"
    keep_alive true
  end
end
