# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposDomainSync < Formula
  version "0.4.1"
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-domain-sync/archive/refs/tags/0.4.1.tar.gz"
  sha256 "e68958029b50f94693fddc254f5e0d5308146119afb46a4527a57a62277c3095"


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
