class Fuguseed < Formula
  desc "Make BIP39 seed words with dice, and turn them into a SeedQR"
  homepage "https://seed.fugubsd.org/"
  url "https://github.com/FuguBSD/FuguSeed/releases/download/v0.2.0/App-FuguSeed-0.2.0.tar.gz"
  sha256 "deb78d221a1bdf218acd37ca8db48f2b720e551985c914da6aac756295aa03ee"
  license "ISC"

  depends_on "fugubsd/tap/fugu"
  depends_on "perl"

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", Formula["fugubsd/tap/fugu"].opt_libexec/"lib/perl5"

    system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
    system "make", "install"
    man1.install "man/fuguseed-words/fuguseed-words.1", "man/fuguseed-last/fuguseed-last.1",
                 "man/fuguseed-qr/fuguseed-qr.1"
    man7.install "man/fuguseed/fuguseed.7"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", PERL5LIB: ENV["PERL5LIB"])
  end

  test do
    assert_match "usage: fuguseed-words", shell_output("#{bin}/fuguseed-words --help")
  end
end
