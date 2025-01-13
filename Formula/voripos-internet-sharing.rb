# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposInternetSharing < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/vori-pos-internet-sharing-release/archive/refs/tags/0.1.0.tar.gz"
  sha256 "33e28cef1f05dddc928ff6080d08e9371f083c67cb49cb6621648c1bad00bc4e"
  version "0.1.0"

  depends_on "dnsmasq"

  def install
    sbin.install "VoriPOSInternetSharing"
  end
end
