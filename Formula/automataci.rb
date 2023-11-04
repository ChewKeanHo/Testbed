class AutomataCI < Formula
  desc "Solid Foundation for Kickstarting Your Software Development"
  homepage "https://your-product.website.here"
  license "Apache-2.0"
  url "https://github.com/ChewKeanHo/AutomataCI/releases/download/1.7.0/automataci-homebrew_1.7.0_any-any.tar.xz"
  sha256 "10523db4fa99e129913505d9ca807a870c25370d5dabdd12af88e7638fa17836"


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
