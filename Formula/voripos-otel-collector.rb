# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposOtelCollector < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-otel-collector/archive/refs/tags/0.4.1.tar.gz"
  version "0.4.1"
  sha256 "a9aa0bd577c6b0b1c4ce5d294a86a2dbe5abe5a938ed3eafe286091be622dc40"

  depends_on "jq" # Needed for parsing API responses
  depends_on "voriteam/voripos/otelcol-contrib"

  def install
    # Move everything under #{libexec}/
    libexec.install Dir["*"]

    # Then write executables under #{bin}/
    bin.write_exec_script (libexec/"voripos-otel-collector.sh")
  end

  service do
    run opt_bin/"voripos-otel-collector.sh"
    keep_alive true
    log_path opt_prefix/"var/log/voripos-otel-collector.log"
    error_log_path opt_prefix/"var/log/voripos-otel-collector.err.log"
  end
end
