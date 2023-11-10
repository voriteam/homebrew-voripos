# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
class VoriposOtelCollector < Formula
  homepage "https://vori.com"
  url "https://github.com/voriteam/voripos-otel-collector/archive/refs/tags/0.1.0.tar.gz"
  version "0.1.0"
  sha256 "48042f7cc6f97d383a08a3c92829feabbf6728fdbf5dd68ecad7c1a7ff890f10"

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
  end
end
