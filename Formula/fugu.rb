class Fugu < Formula
  desc "OpenBSD-style daemon utilities for Perl"
  homepage "https://lib.fugubsd.org/"
  url "https://github.com/FuguBSD/Fugu/releases/download/v0.5.6/Fugu-0.5.6.tar.gz"
  sha256 "ce02ce7e9b5d7e4ac48dc2c0a89f99ff4132707573d2fa9641b847554b4f17f3"
  license "ISC"

  depends_on "perl"

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"

    system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
    system "make", "install"
  end

  test do
    system Formula["perl"].opt_bin/"perl", "-I#{libexec}/lib/perl5", "-MFugu::Daemon", "-e", "1"
  end
end
