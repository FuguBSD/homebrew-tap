class Fugu < Formula
  desc "OpenBSD-style daemon utilities for Perl"
  homepage "https://lib.fugubsd.org/"
  url "https://github.com/FuguBSD/Fugu/releases/download/v0.5.3/Fugu-0.5.3.tar.gz"
  sha256 "d9c45ca527afa7914f661cf8b59510e137709400e4fb05455deb37ccfd162b46"
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
