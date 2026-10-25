class ContactMissingConsentFields < Formula
  desc "contact-missing-consent-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/contact-missing-consent-fields/contact-missing-consent-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "385e084d6eed00e441b30135fe025bbbf0f24df9f71743c244080dbd9e7f14ac"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"contact-missing-consent-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/contact_missing_consent_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"contact_missing_consent_fields.py"
  end
end
