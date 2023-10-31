# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposTxnSync < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-txn-sync/archive/refs/tags/0.1.1.tar.gz"
  version "0.1.1"
  sha256 "ad13d13eb9525ad9d8c5f2ca6a0d71a7d50c36c11a487db29c0654036da5aa1b"

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
