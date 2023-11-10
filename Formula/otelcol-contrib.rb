# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class OtelcolContrib < Formula
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.88.0/otelcol-contrib_0.88.0_darwin_arm64.tar.gz"
  version "0.88.0"
  sha256 "0bf94a21c8f60437345408aaaa493ccc9de8093a443dbe6d91da4bf3700a8a93"

  depends_on arch: :arm64

  def install
    bin.install "otelcol-contrib"
  end
end
