class OrderPaymentMethodGroupCounts < Formula
  desc "order-payment-method-group-counts"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/order-payment-method-group-counts/order-payment-method-group-counts-0.1.0.zip"
  version "0.1.0"
  sha256 "52770fcfe2e229fb23b348319331269d0ac5bece28ddbba3f32c8acf915b207d"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"order-payment-method-group-counts").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/order_payment_method_group_counts.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"order_payment_method_group_counts.py"
  end
end
