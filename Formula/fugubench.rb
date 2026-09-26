class Fugubench < Formula
  desc "Outfit a FuguBSD checkout for a coding agent"
  homepage "https://github.com/FuguBSD/FuguBench"
  url "https://github.com/FuguBSD/FuguBench/releases/download/v0.1.0/App-FuguBench-0.1.0.tar.gz"
  sha256 "0fc072db2a0e8cb919b4bc46a07e1f6101e3a020a0f50bc57c6d91b561c71ed4"
  license "ISC"

  depends_on "fugubsd/tap/fugu"
  depends_on "perl"

  def install
    ENV.prepend_create_path "PERL5LIB", libexec/"lib/perl5"
    ENV.prepend_path "PERL5LIB", Formula["fugubsd/tap/fugu"].opt_libexec/"lib/perl5"

    system "perl", "Makefile.PL", "INSTALL_BASE=#{libexec}"
    system "make", "install"
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", PERL5LIB: ENV["PERL5LIB"])
  end

  test do
    assert_match "fugubench #{version}", shell_output("#{bin}/fugubench version")
  end
end
