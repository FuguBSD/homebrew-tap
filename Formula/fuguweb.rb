class Fuguweb < Formula
  desc "Build a documentation website for a Perl project"
  homepage "https://web.fugubsd.org/"
  url "https://github.com/FuguBSD/FuguWeb/releases/download/v0.8.0/App-FuguWeb-0.8.0.tar.gz"
  sha256 "0cb5942c2a98e7b35f1f4ed0b4c840133119b9b5f4319fc6f5a91d0012e1b48d"
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
