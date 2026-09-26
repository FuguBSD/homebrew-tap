class Fuguvm < Formula
  desc "Install and manage OpenBSD virtual machines under QEMU"
  homepage "https://vm.fugubsd.org/"
  url "https://github.com/FuguBSD/FuguVM/releases/download/v0.3.0/App-FuguVM-0.3.0.tar.gz"
  sha256 "7fbf47dc543f9aef02602f9966ff008dbc8409e007095eb68eb5d649f83e1441"
  license "ISC"

  depends_on "expect"
  depends_on "fugubsd/tap/fugu"
  depends_on "libssh2"
  depends_on "openssl@3"
  depends_on "perl"
  depends_on "qemu"
  depends_on "telnet"

  # The CPAN prerequisites of App::FuguVM, with their own closure,
  # in dependency order.
  resource "Clone" do
    url "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/Clone-0.50.tar.gz"
    sha256 "f9732a4a857974db30905233589113003301b585b0cecda29a21cfba5bb014f9"
  end

  resource "Encode-Locale" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/Encode-Locale-1.05.tar.gz"
    sha256 "176fa02771f542a4efb1dbc2a4c928e8f4391bf4078473bd6040d8f11adb0ec1"
  end

  resource "ExtUtils-Config" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/ExtUtils-Config-0.010.tar.gz"
    sha256 "82e7e4e90cbe380e152f5de6e3e403746982d502dd30197a123652e46610c66d"
  end

  resource "ExtUtils-Helpers" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/ExtUtils-Helpers-0.028.tar.gz"
    sha256 "c8574875cce073e7dc5345a7b06d502e52044d68894f9160203fcaab379514fe"
  end

  resource "ExtUtils-InstallPaths" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-0.015.tar.gz"
    sha256 "7d64eb2dfa87ead010cdf55c8a1bdfde50b7b5852d7cb8cf2304f55bea2eb007"
  end

  resource "TimeDate" do
    url "https://cpan.metacpan.org/authors/id/A/AT/ATOOMIC/TimeDate-2.35.tar.gz"
    sha256 "baddd0306ae2e86e9ec28d3de5439e514643e80b3735e43bd0fbb426d73304de"
  end

  resource "HTTP-Date" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Date-6.08.tar.gz"
    sha256 "b57d80ca6d821c6949ca48b27467d45aba7a9c77346562306facca781a003e44"
  end

  resource "File-Listing" do
    url "https://cpan.metacpan.org/authors/id/P/PL/PLICEASE/File-Listing-6.16.tar.gz"
    sha256 "189b3a13fc0a1ba412b9d9ec5901e9e5e444cc746b9f0156d4399370d33655c6"
  end

  resource "HTML-Tagset" do
    url "https://cpan.metacpan.org/authors/id/P/PE/PETDANCE/HTML-Tagset-3.24.tar.gz"
    sha256 "eb89e145a608ed1f8f141a57472ee5f69e67592a432dcd2e8b1dbb445f2b230b"
  end

  resource "IO-HTML" do
    url "https://cpan.metacpan.org/authors/id/C/CJ/CJM/IO-HTML-1.004.tar.gz"
    sha256 "c87b2df59463bbf2c39596773dfb5c03bde0f7e1051af339f963f58c1cbd8bf5"
  end

  resource "LWP-MediaTypes" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/LWP-MediaTypes-6.05.tar.gz"
    sha256 "abb2dcfbf069317fe65b098e3b2ad58c5eb33e9a839b9190cce6d371f8966cc1"
  end

  resource "MIME-Base32" do
    url "https://cpan.metacpan.org/authors/id/R/RE/REHSACK/MIME-Base32-1.303.tar.gz"
    sha256 "ab21fa99130e33a0aff6cdb596f647e5e565d207d634ba2ef06bdbef50424e99"
  end

  resource "URI" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/URI-5.37.tar.gz"
    sha256 "5a8750ddd8ee743d7cc89bebdd542a9b78a34023164ebe19dea0c248e121c21e"
  end

  resource "HTTP-Message" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Message-7.04.tar.gz"
    sha256 "699f3350dbb7bd8fdc9f3b013b0c91b7c059783708443e39bc395fa33352f006"
  end

  resource "HTML-Parser" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTML-Parser-3.86.tar.gz"
    sha256 "5305e1d5faa70ee0aa282d85a5c9aa93911e8c7afa590ad1ced5703a544e20f6"
  end

  resource "HTTP-Cookies" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Cookies-6.12.tar.gz"
    sha256 "4e460c4bae76285bfc726f641349402fc9038fcd9ca0f33346bec036d73876b8"
  end

  resource "Module-Build-Tiny" do
    url "https://cpan.metacpan.org/authors/id/L/LE/LEONT/Module-Build-Tiny-0.053.tar.gz"
    sha256 "3726d622da6f655e88fdf89e4fd597709c44970b47de65082003e8d86b5e193a"
  end

  resource "HTTP-Daemon" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/HTTP-Daemon-6.17.tar.gz"
    sha256 "16281580c40e23108d028434698b5d7d53637bf904c9df822481e253cbec920c"
  end

  resource "HTTP-Negotiate" do
    url "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Negotiate-6.01.tar.gz"
    sha256 "1c729c1ea63100e878405cda7d66f9adfd3ed4f1d6cacaca0ee9152df728e016"
  end

  resource "Net-HTTP" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/Net-HTTP-6.24.tar.gz"
    sha256 "290ed9a97b05c7935b048e6d2a356035871fca98ad72c01c5961726adf85c83c"
  end

  resource "Net-SSH2" do
    url "https://cpan.metacpan.org/authors/id/R/RK/RKITOVER/Net-SSH2-0.74.tar.gz"
    sha256 "1c124699745eeb40ed636097fdcc3e722c94cfd7704ebc0acfb0f05541d2809c"
  end

  resource "Try-Tiny" do
    url "https://cpan.metacpan.org/authors/id/E/ET/ETHER/Try-Tiny-0.32.tar.gz"
    sha256 "ef2d6cab0bad18e3ab1c4e6125cc5f695c7e459899f512451c8fa3ef83fa7fc0"
  end

  resource "WWW-RobotRules" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/WWW-RobotRules-6.03.tar.gz"
    sha256 "8522b532935a11bfa688c2e113bac66729df4851be50c2c26d4b06f45fade472"
  end

  resource "libwww-perl" do
    url "https://cpan.metacpan.org/authors/id/O/OA/OALDERS/libwww-perl-6.83.tar.gz"
    sha256 "e75f0fa9d3c6f0daf5a5a72fa9f8b1c9c0d23e3a84a8522ccb4f835232b95505"
  end

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", Formula["fugubsd/tap/fugu"].opt_libexec/"lib/perl5"

    resources.each do |r|
      r.stage do
        if File.exist?("Build.PL")
          system "perl", "Build.PL", "--install_base", libexec
          system "./Build"
          system "./Build", "install"
        else
          args = ["INSTALL_BASE=#{libexec}"]
          # The Makefile.PL of Net::SSH2 shells out to brew for the
          # libssh2 paths unless the arguments name them.
          if r.name == "Net-SSH2"
            args << "lib=#{Formula["libssh2"].opt_lib}"
            args << "inc=#{Formula["libssh2"].opt_include}"
          end
          system "perl", "Makefile.PL", *args
          system "make", "install"
        end
      end
    end

    system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
    system "make", "install"
    man1.install "man/fuguvm/fuguvm.1"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", PERL5LIB: ENV["PERL5LIB"])
  end

  test do
    assert_match "usage: fuguvm", shell_output("#{bin}/fuguvm --help")
  end
end
