# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposOtelCollector < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-otel-collector/archive/refs/tags/0.2.0.tar.gz"
  version "0.2.0"
  sha256 "9c2ea7cd37569f086d2087f8b0ed1f8c6c33e6f1f396a4b0a94fc2a08b1bfbe0"

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
