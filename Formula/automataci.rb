class AutomataCI < Formula
  desc "Solid Foundation for Kickstarting Your Software Development"
  homepage "https://your-product.website.here"
  license "Apache-2.0"
  url "https://github.com/ChewKeanHo/AutomataCI/releases/download/1.7.0/automataci-homebrew_1.7.0_any-any.tar.xz"
  sha256 "0a64dbffc4bc899239dbda9fb8c72c795febaa6abc3c9d0e8a85397f697b344a"


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
