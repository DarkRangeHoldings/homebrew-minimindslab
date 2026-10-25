class InventoryDuplicateSkuDetector < Formula
  desc "inventory-duplicate-sku-detector"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/inventory-duplicate-sku-detector/inventory-duplicate-sku-detector-0.1.0.zip"
  version "0.1.0"
  sha256 "4731e39cecb10371d90134a3f41b9a1acbf9a55eaceec752aab77930918bc92b"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"inventory-duplicate-sku-detector").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/inventory_duplicate_sku_detector.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"inventory_duplicate_sku_detector.py"
  end
end
