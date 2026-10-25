class EventDuplicateExternalIdDetector < Formula
  desc "event-duplicate-external-id-detector"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/event-duplicate-external-id-detector/event-duplicate-external-id-detector-0.1.0.zip"
  version "0.1.0"
  sha256 "2c5c86203ec3bea91f935c416bb04dbfa1bc2d26962669eadd04a6f4d7ae8c50"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"event-duplicate-external-id-detector").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/event_duplicate_external_id_detector.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"event_duplicate_external_id_detector.py"
  end
end
