# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class OtelcolContrib < Formula
  homepage "https://github.com/open-telemetry/opentelemetry-collector-releases"
  url "https://github.com/open-telemetry/opentelemetry-collector-releases/releases/download/v0.91.0/otelcol-contrib_0.91.0_darwin_arm64.tar.gz"
  version "0.91.0"
  sha256 "19151d5cb37feec52fccb6c4ae64f0a07c4328645d86400f9493f4538791c14f"

  depends_on arch: :arm64

  def install
    bin.install "otelcol-contrib"
  end
end
