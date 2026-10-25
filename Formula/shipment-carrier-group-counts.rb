class ShipmentCarrierGroupCounts < Formula
  desc "shipment-carrier-group-counts"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/shipment-carrier-group-counts/shipment-carrier-group-counts-0.1.0.zip"
  version "0.1.0"
  sha256 "07ea91b0de951bbdda9004fca28a0b65001954019143ee246295f9ea40e95d1e"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"shipment-carrier-group-counts").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/shipment_carrier_group_counts.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"shipment_carrier_group_counts.py"
  end
end
