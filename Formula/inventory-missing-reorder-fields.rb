class InventoryMissingReorderFields < Formula
  desc "inventory-missing-reorder-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/inventory-missing-reorder-fields/inventory-missing-reorder-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "9a4c60dafa5d76b1f8d978f72b62e056aac0ddc0b24bd4c5ce0443ae0587d71a"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"inventory-missing-reorder-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/inventory_missing_reorder_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"inventory_missing_reorder_fields.py"
  end
end
