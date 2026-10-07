class Fuguweb < Formula
  desc "Build a documentation website for a Perl project"
  homepage "https://web.fugubsd.org/"
  url "https://github.com/FuguBSD/FuguWeb/releases/download/v0.7.1/App-FuguWeb-0.7.1.tar.gz"
  sha256 "fb1acfe541ac9b6f7ecd0ce93efe9a9946a01560410c37c60c24c0a6b65d8881"
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
