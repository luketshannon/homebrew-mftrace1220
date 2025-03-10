class Mftrace1220 < Formula
    desc "Trace TeX bitmap font to PFA, PFB, or TTF font, patched for MTDBT2F."
    homepage "https://lilypond.org/mftrace/"
    url "https://github.com/o-r-g/homebrew-mftrace1220/releases/download/v0.1.0/mftrace1220.tar.gz"
    sha256 "e57b70bad7c831eb2e79105e4b22db6808f401602dc48a8c82b987d82683a130"
    license "GPL-2.0-only"
    revision 1
  
    livecheck do
      url :homepage
      regex(/href=.*?mftrace[._-]v?(\d+(?:\.\d+)+)\.t/i)
    end
  
    head do
        url "https://github.com/hanwen/mftrace.git", branch: "master"
        depends_on "autoconf" => :build
        depends_on "automake" => :build
        depends_on "libtool"  => :build
    end
  
    depends_on "fontforge"
    depends_on "potrace"
    depends_on "python@3.13"
    depends_on "t1utils"
    # these are needed so we can run `autoreconf` or `./autogen.sh` in stable
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool"  => :build

    conflicts_with "mftrace", because: "both install the same binaries (mftrace, gf2pbm) and manpages"
  
    # fixed in https://github.com/hanwen/mftrace/pull/14
    resource "manpage" do
      url "https://github.com/hanwen/mftrace/raw/release/1.2.20/gf2pbm.1"
      sha256 "f2a7234cba5f59237e3cc1f67e395046b381a012456d4e6e9963673cf35d46fb"
    end
  
    def install
        ENV["PYTHON"] = which("python3.13")
        buildpath.install resource("manpage") if build.stable?
    
        # run autoconf/automake to generate the configure script
        system "autoreconf", "-fvi"
    
        system "./configure", *std_configure_args
        system "make", "install"
    end
  
    test do
      system bin/"mftrace", "--version"
    end
  end
