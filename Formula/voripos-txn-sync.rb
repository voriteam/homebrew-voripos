# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposTxnSync < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-txn-sync/archive/refs/tags/0.1.0.tar.gz"
  version "0.1.0"
  sha256 "eb4a2fbf69dc670d77a6c62c8a5ad93e625900adee1e091455e9d93c31b653a8"

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
