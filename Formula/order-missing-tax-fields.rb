class OrderMissingTaxFields < Formula
  desc "order-missing-tax-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/order-missing-tax-fields/order-missing-tax-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "6d851aff8ddb4e39538d5c67de21e50e6e619977732236445b7f15690f3cc683"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"order-missing-tax-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/order_missing_tax_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"order_missing_tax_fields.py"
  end
end
