class OrderMissingContactFields < Formula
  desc "order-missing-contact-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/order-missing-contact-fields/order-missing-contact-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "c08df7284e9dba8a4253f2125e827c7c2784cec0994118b5e8815beed16b6fda"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"order-missing-contact-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/order_missing_contact_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"order_missing_contact_fields.py"
  end
end
