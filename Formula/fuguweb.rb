class Fuguweb < Formula
  desc "Build a documentation website for a Perl project"
  homepage "https://web.fugubsd.org/"
  url "https://github.com/FuguBSD/FuguWeb/releases/download/v0.10.1/App-FuguWeb-0.10.1.tar.gz"
  sha256 "e3bb1b0d8c5ca7e5866cbe01773b6e089d4c6bdcc5b9db9e442151f169be3805"
  license "ISC"

  depends_on "fugubsd/tap/fugu"
  depends_on "lowdown"
  depends_on "mandoc"
  depends_on "perl"

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", Formula["fugubsd/tap/fugu"].opt_libexec/"lib/perl5"

    system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
    system "make", "install"
    man1.install "man/fuguweb/fuguweb.1"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", PERL5LIB: ENV["PERL5LIB"])
  end

  test do
    assert_match "usage: fuguweb", shell_output("#{bin}/fuguweb --help")
  end
end
