# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class OtelcolContrib < Formula
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.111.0/otelcol-contrib_0.111.0_darwin_arm64.tar.gz"
  version "0.111.0"
  sha256 "e56bf2cb535b6c089915415d2ab5e477c98628d03f3376aaf9124fa4f8b24f97"

  depends_on arch: :arm64

  def install
    bin.install "otelcol-contrib"
  end
end
