# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposDomainSync < Formula
  version "0.2.0"
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-domain-sync/archive/refs/tags/0.2.0.tar.gz"
  sha256 "df1bbbce2743430eb9a0d63acd89ba179417f83c3aa9f6c4b808376275caccaf"


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
