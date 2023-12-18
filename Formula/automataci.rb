class AutomataCI < Formula
  desc "Solid Foundation for Kickstarting Your Software Development"
  homepage "https://your-product.website.here"
  license "Apache-2.0"
  url "https://github.com/ChewKeanHo/AutomataCI/releases/download/1.7.0/automataci-homebrew_1.7.0_any-any.tar.xz"
  sha256 "0cefd13be119b6eaeb11ff48b79dbd9dd05c1e09d2f3c2d84fc23dced8ef77a9"


  def install
    system "./automataCI/ci.sh.ps1 setup"
    system "./automataCI/ci.sh.ps1 prepare"
    system "./automataCI/ci.sh.ps1 materialize"
    chmod 0755, "bin/automataci"
    bin.install "bin/automataci"
  end

  test do
    system "./automataCI/ci.sh.ps1 setup"
    system "./automataCI/ci.sh.ps1 prepare"
    system "./automataCI/ci.sh.ps1 materialize"
    assert_predicate ./bin/automataci, :exist?
  end
end
