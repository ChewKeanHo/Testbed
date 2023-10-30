class AutomataCI < Formula
  desc "Solid Foundation for Kickstarting Your Software Development"
  homepage "https://your-product.website.here"
  license "Apache-2.0"
  url "https://github.com/ChewKeanHo/AutomataCI/releases/download/1.7.0/automataci-homebrew_1.7.0_any-any.tar.xz"
  sha256 "c21f4674e94865bf02a79751575a5d9d53a1ee58ee0caa853f04764b5b3824b6"


  def install
    system "./ci.cmd setup"
    system "./ci.cmd prepare"
    system "./ci.cmd materialize"
    chmod 0755, "bin/automataci"
    bin.install "bin/automataci"
  end

  test do
    system "./ci.cmd setup"
    system "./ci.cmd prepare"
    system "./ci.cmd materialize"
    assert_predicate ./bin/automataci, :exist?
  end
end
