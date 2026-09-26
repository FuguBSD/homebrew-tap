class Fugu < Formula
  desc "OpenBSD-style daemon utilities for Perl"
  homepage "https://lib.fugubsd.org/"
  url "https://github.com/FuguBSD/Fugu/releases/download/v0.5.1/Fugu-0.5.1.tar.gz"
  sha256 "e2e1167b82e8e00be57e308aa7abfaca85dea1b610b7f60f49101313bc0a16b4"
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
