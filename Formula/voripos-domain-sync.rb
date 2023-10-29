# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposDomainSync < Formula
  version "0.1.0"
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-domain-sync/archive/refs/tags/0.1.0.tar.gz"
  sha256 "dd0c7b5fa69bd0d626c79a5a0970c06be0a65ca93a72971e23200931f049d190"


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
