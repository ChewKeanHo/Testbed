class AutomataCI < Formula
  desc "Solid Foundation for Kickstarting Your Software Development"
  homepage "https://your-product.website.here"
  license "Apache-2.0"
  url "https://github.com/ChewKeanHo/AutomataCI/releases/download/1.6.0/automataci-homebrew_1.6.0_any-any.tar.xz"
  sha256 "27302ff9f0ab5c9d3ec804e601b5dc538d176fbc85d302fc446dfd930a1284f3"

  on_linux do
    depends_on "gcc" => [:build, :test]
  end

  on_macos do
    depends_on "clang" => [:build, :test]
  end

  def install
    system "./ci.cmd setup"
    system "./ci.cmd prepare"
    system "./ci.cmd materialize"
    chmod 0755, "bin/automataci"
    bin.install "bin/automataci"
    libexec.install Dir["lib/*"]
  end

  test do
    system "./ci.cmd setup"
    system "./ci.cmd prepare"
    system "./ci.cmd materialize"
    assert_predicate ./bin/automataci, :exist?
  end
end
