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

    def install
        ENV["PYTHON"] = Formula["python@3.9"].opt_bin/"python3"
        system "./configure", *std_configure_args
        system "make", "install"
      end      

    test do
        assert_match "mftrace #{version}", shell_output("#{bin}/mftrace --version")
    end
end