class AutomataCI < Formula
  desc "Solid Foundation for Kickstarting Your Software Development"
  homepage "https://your-product.website.here"
  license "Apache-2.0"
  url "https://github.com/ChewKeanHo/AutomataCI/releases/download/1.6.0/automataci-homebrew_1.6.0_any-any.tar.xz"
  sha256 "7511d7bcd7064d96fffdd223e8a30e7353f1c2a65b73d9dd476f2e320dbde9df"


  depends_on "go" => [:build, :test]

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
