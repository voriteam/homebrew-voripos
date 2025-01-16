# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposInternetSharing < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/vori-pos-internet-sharing-release/archive/refs/tags/0.1.1.tar.gz"
  sha256 "8ef6ed210de7e107a78a4cd17344413f099d717caa73873a6f7ea53245bd00bb"
  version "0.1.1"

  depends_on "dnsmasq"

  def install
    sbin.install "VoriPOSInternetSharing"
  end
end
