class OrderShippingCountryGroupCounts < Formula
  desc "order-shipping-country-group-counts"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/order-shipping-country-group-counts/order-shipping-country-group-counts-0.1.0.zip"
  version "0.1.0"
  sha256 "fe99703970791c31c8945241fe06995aa7bd85325e09ee2f01d6b2866c6c92e5"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"order-shipping-country-group-counts").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/order_shipping_country_group_counts.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"order_shipping_country_group_counts.py"
  end
end
