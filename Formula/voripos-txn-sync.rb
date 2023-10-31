# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposTxnSync < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-txn-sync/archive/refs/tags/0.1.2.tar.gz"
  version "0.1.2"
  sha256 "d04001de755913afd02e189645bf75c402cff852d172edbef058a8d9e9c962cc"

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
