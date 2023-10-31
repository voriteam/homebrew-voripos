# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposDomainSync < Formula
  version "0.1.2"
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-domain-sync/archive/refs/tags/0.1.2.tar.gz"
  sha256 "11e22ff538d6448dcf2bec683da02ceedbcacdbcd684ffac87719e5915505e4a"


  def install
    # Move everything under #{libexec}/
    libexec.install Dir["*"]

    # Then write executables under #{bin}/
    bin.write_exec_script (libexec/"voripos-domain-sync.sh")
  end

  service do
    run opt_bin/"voripos-domain-sync.sh"
    keep_alive true
  end
end
