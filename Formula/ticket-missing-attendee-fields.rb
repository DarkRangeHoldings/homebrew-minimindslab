class TicketMissingAttendeeFields < Formula
  desc "ticket-missing-attendee-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/ticket-missing-attendee-fields/ticket-missing-attendee-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "e6bebee7abff5ece6d1a09aff6e16c5779de238790ca226a213200a3a05f7569"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"ticket-missing-attendee-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/ticket_missing_attendee_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"ticket_missing_attendee_fields.py"
  end
end
