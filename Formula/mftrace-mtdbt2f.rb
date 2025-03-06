class MftraceMtdbt2f < Formula
    desc "Trace TeX bitmap font to PFA, PFB, or TTF font (Patched to work with Meta-The-Difference-Between-The-Two-Font)"
    homepage "https://lilypond.org/mftrace/"
    url "https://github.com/luketshannon/homebrew-mftracemtdbt2f/releases/download/v0.1.0/mftrace-mtdbt2f.tar.gz"
    sha256 "e57b70bad7c831eb2e79105e4b22db6808f401602dc48a8c82b987d82683a130"
    version "0.1.0"

    depends_on "fontforge"
    depends_on "potrace"
    depends_on "python@3.9"
    depends_on "t1utils"

    resource "manpage" do
        url "https://github.com/hanwen/mftrace/raw/release/1.2.20/gf2pbm.1"
        sha256 "f2a7234cba5f59237e3cc1f67e395046b381a012456d4e6e9963673cf35d46fb"
    end
    
    def install
        buildpath.install resource("manpage") if build.stable?
        system "./autogen.sh" if build.head?
        system "./configure", "--prefix=#{prefix}"
        system "make", "install"
    end  

    test do
        assert_match "mftrace #{version}", shell_output("#{bin}/mftrace --version")
    end
end