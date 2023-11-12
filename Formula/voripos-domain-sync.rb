# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposDomainSync < Formula
  version "0.4.2"
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-domain-sync/archive/refs/tags/0.4.2.tar.gz"
  sha256 "dbe1c7583e9f49f7c17b8904df69abc3cd56668fc52aae4ea06eee64433c592f"


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
