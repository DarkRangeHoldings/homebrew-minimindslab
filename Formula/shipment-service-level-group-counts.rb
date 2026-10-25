class ShipmentServiceLevelGroupCounts < Formula
  desc "shipment-service-level-group-counts"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/shipment-service-level-group-counts/shipment-service-level-group-counts-0.1.0.zip"
  version "0.1.0"
  sha256 "b5689daa34d4019cba8e55487c6bc770566de1e079a00e8d4089ffe8bafd5af0"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"shipment-service-level-group-counts").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/shipment_service_level_group_counts.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"shipment_service_level_group_counts.py"
  end
end
