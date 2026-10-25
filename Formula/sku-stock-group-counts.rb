class SkuStockGroupCounts < Formula
  desc "sku-stock-group-counts"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/sku-stock-group-counts/sku-stock-group-counts-0.1.0.zip"
  version "0.1.0"
  sha256 "184f3f6bd1e1416d670db1e9a86c11db1d615b785238dbf0fa560753749afbc8"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"sku-stock-group-counts").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/sku_stock_group_counts.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"sku_stock_group_counts.py"
  end
end
