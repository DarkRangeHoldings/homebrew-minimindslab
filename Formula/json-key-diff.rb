class JsonKeyDiff < Formula
  desc "json-key-diff"
  homepage "https://minimindslab.com"
  url "https://minimindslab.com/downloads/cli/json-key-diff/json-key-diff-0.1.0.zip"
  version "0.1.0"
  sha256 "bcdafcc4fb005ad5998387e795cccf66aa0fcbd67735784814aef7147582599d"
  depends_on "python@3.13"
  def install
    libexec.install Dir["*"]
    (bin/"json-key-diff").write <<~EOS
      #!/bin/sh
      exec "#{Formula["python@3.13"].opt_bin}/python3.13" "#{libexec}/json_key_diff.py" "$@"
    EOS
  end
  test do
    system Formula["python@3.13"].opt_bin/"python3.13", "-m", "py_compile", libexec/"json_key_diff.py"
  end
end
