class EventMissingVenueFields < Formula
  desc "event-missing-venue-fields"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/event-missing-venue-fields/event-missing-venue-fields-0.1.0.zip"
  version "0.1.0"
  sha256 "537cc54eb48b47755419793f73d6bae8f1406ace3f427a7226270c251720f923"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"event-missing-venue-fields").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/event_missing_venue_fields.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"event_missing_venue_fields.py"
  end
end
