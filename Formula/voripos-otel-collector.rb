# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposOtelCollector < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-otel-collector/archive/refs/tags/0.3.0.tar.gz"
  version "0.3.0"
  sha256 "142dba90c9ee4558685ad694e9b9d8d93aebb306d2b460efc0a4f24a127136e4"

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
