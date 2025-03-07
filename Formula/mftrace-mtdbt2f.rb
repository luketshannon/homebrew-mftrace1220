class MftraceMtdbt2f < Formula
    desc "Trace TeX bitmap font to PFA, PFB, or TTF font, patched for MTDBT2F."
    homepage "https://lilypond.org/mftrace/"
    url "https://github.com/luketshannon/homebrew-mftracemtdbt2f/releases/download/v0.1.0/mftrace-mtdbt2f.tar.gz"
    sha256 "e57b70bad7c831eb2e79105e4b22db6808f401602dc48a8c82b987d82683a130"
    license "GPL-2.0-only"
    revision 1
  
    livecheck do
      url :homepage
      regex(/href=.*?mftrace[._-]v?(\d+(?:\.\d+)+)\.t/i)
    end
  
    bottle do
      rebuild 4
      sha256 cellar: :any_skip_relocation, arm64_sequoia: "097fa4cc166f51d4033415a651817207d3a5734ef50237969b84f5a8fc6ddfb4"
      sha256 cellar: :any_skip_relocation, arm64_sonoma:  "9415613e99216e1174b5e962761cef44084c8e9ef41208673b31e44d55879828"
      sha256 cellar: :any_skip_relocation, arm64_ventura: "e639eb620cac19e786da74b7a387f742f23837823bb2dee341e42a5b6df751d2"
      sha256 cellar: :any_skip_relocation, sonoma:        "69753e27a76317dfa0c872ac7a7a90e8c0849c39fae13a1cc677a1b1ded7c26f"
      sha256 cellar: :any_skip_relocation, ventura:       "406e8d33e1825be811ad65d5b77d9f9538011238b3811b9cda2f40bdf50a3b80"
      sha256 cellar: :any_skip_relocation, x86_64_linux:  "138d79020d6a8942911908b01c237b00dc0847d9d8e4a506818db60e54aef44c"
    end
  
    head do
      url "https://github.com/hanwen/mftrace.git", branch: "master"
      depends_on "autoconf" => :build
    end
  
    depends_on "fontforge"
    depends_on "potrace"
    depends_on "python@3.13"
    depends_on "t1utils"
  
    # Fixed in https://github.com/hanwen/mftrace/pull/14
    resource "manpage" do
      url "https://github.com/hanwen/mftrace/raw/release/1.2.20/gf2pbm.1"
      sha256 "f2a7234cba5f59237e3cc1f67e395046b381a012456d4e6e9963673cf35d46fb"
    end
  
    def install
      ENV["PYTHON"] = which("python3.13")
      buildpath.install resource("manpage") if build.stable?
      system "./autogen.sh" if build.head?
      system "./configure", *std_configure_args
      system "make", "install"
    end
  
    test do
      system bin/"mftrace", "--version"
    end
  end

# class MftraceMtdbt2f < Formula
#     desc "Trace TeX bitmap font to PFA, PFB, or TTF font (Patched to work with Meta-The-Difference-Between-The-Two-Font)"
#     homepage "https://lilypond.org/mftrace/"
#     url "https://github.com/luketshannon/homebrew-mftracemtdbt2f/releases/download/v0.1.0/mftrace-mtdbt2f.tar.gz"
#     sha256 "e57b70bad7c831eb2e79105e4b22db6808f401602dc48a8c82b987d82683a130"
#     version "0.1.0"
#     license "GPL-2.0"
#     revision 1

#     bottle do
#       sha256 cellar: :any_skip_relocation, big_sur:     "09ca3daeb696824e12655d6dbd0c768a0dcc07306c35001bc7b90417fb2b38c6"
#       sha256 cellar: :any_skip_relocation, catalina:    "da5fc2002936d2260121ce8134472bce14e8bccfb406fe9e1e56591037aa9751"
#       sha256 cellar: :any_skip_relocation, mojave:      "d4b3535bdd69a89c59c4b7d7011ccb06544108c376e6313f62062c32991dece2"
#       sha256 cellar: :any_skip_relocation, high_sierra: "e1d8b241eb03982520cf2b4b2f8794fe74afb240247e4ea7c8164b1c9a22e974"
#     end

#     head do
#       url "https://github.com/hanwen/mftrace.git"
#       depends_on "autoconf" => :build
#     end

#     depends_on "fontforge"
#     depends_on "potrace"
#     depends_on "python@3.9"
#     depends_on "t1utils"

#     resource "manpage" do
#       url "https://github.com/hanwen/mftrace/raw/release/1.2.20/gf2pbm.1"
#       sha256 "f2a7234cba5f59237e3cc1f67e395046b381a012456d4e6e9963673cf35d46fb"
#     end

#     def install
#     #   buildpath.install resource("manpage") if build.stable?
#     #   system "./autogen.sh" if build.head?
#     #   system "./configure", "--prefix=#{prefix}"
#     #   system "make", "install"
#         system "autoreconf", "-fvi"
#         system "./configure", *std_configure_args
#         system "make", "install"
#     end
  
#     test do
#       system "#{bin}/mftrace", "--version"
#     end
#   end