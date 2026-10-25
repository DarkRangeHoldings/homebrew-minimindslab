class ContactEmailDomainGroupCounts < Formula
  desc "contact-email-domain-group-counts"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/contact-email-domain-group-counts/contact-email-domain-group-counts-0.1.0.zip"
  version "0.1.0"
  sha256 "1dcaee8560c21ee306d269b612ea93dc0cb0531c721016a3611442bbd16bfbb3"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"contact-email-domain-group-counts").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/contact_email_domain_group_counts.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"contact_email_domain_group_counts.py"
  end
end
