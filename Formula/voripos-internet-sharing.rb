# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposInternetSharing < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/vori-pos-internet-sharing-release/archive/refs/tags/0.1.2.tar.gz"
  sha256 "2fd8f43da6ef8f6587ac74ef1d2a37624cca6ccdd8df112f9a5c7ec4531ad294"
  version "0.1.2"

  depends_on "dnsmasq"

  def install
    sbin.install "VoriPOSInternetSharing"
  end
end
