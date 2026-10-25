class OrderMissingFulfillmentFields < Formula
  desc "order-missing-fulfillment-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/order-missing-fulfillment-fields/order-missing-fulfillment-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "fbb6ab0f21a67d655e1e1f7f43427a7298cdd640b587568b8dbb872afaaa6e18"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"order-missing-fulfillment-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/order_missing_fulfillment_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"order_missing_fulfillment_fields.py"
  end
end
