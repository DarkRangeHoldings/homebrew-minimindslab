class OrderTotalIntegerSummary < Formula
  desc "order-total-integer-summary"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/order-total-integer-summary/order-total-integer-summary-0.1.0.zip"
  version "0.1.0"
  sha256 "2ef6eafbc541a622a45e86bfe2e65e7d3adddb755c10b19c070323393a4681aa"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"order-total-integer-summary").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/order_total_integer_summary.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"order_total_integer_summary.py"
  end
end
