class ShipmentTrackingNumberDuplicateDetector < Formula
  desc "shipment-tracking-number-duplicate-detector"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/shipment-tracking-number-duplicate-detector/shipment-tracking-number-duplicate-detector-0.1.0.zip"
  version "0.1.0"
  sha256 "95937b5ea0078c2953430dd74d6ea06d826df110d83592377fc4ba71a7a2344d"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"shipment-tracking-number-duplicate-detector").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/shipment_tracking_number_duplicate_detector.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"shipment_tracking_number_duplicate_detector.py"
  end
end
