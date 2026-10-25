class OrderMissingBillingFields < Formula
  desc "order-missing-billing-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/order-missing-billing-fields/order-missing-billing-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "97f125c21c0b2bb6284bd17f748cd40cc265c447642c5468917fa6dffc902ce7"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"order-missing-billing-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/order_missing_billing_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"order_missing_billing_fields.py"
  end
end
