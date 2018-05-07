class Unfs3 < Formula
  desc "User-space NFSv3 server"
  homepage "http://unfs3.sourceforge.net"
  url "https://downloads.sourceforge.net/project/unfs3/unfs3/0.9.22/unfs3-0.9.22.tar.gz"
  sha256 "482222cae541172c155cd5dc9c2199763a6454b0c5c0619102d8143bb19fdf1c"

  devel do
    url "https://github.com/derfian/unfs3.git", :branch => "higher-resolution-setattr"
    version "0.9.23-pre"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  head do
    url "http://svn.code.sf.net/p/unfs3/code/trunk/"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
  end

  def install
    ENV.deparallelize # Build is not parallel-safe
    system "./bootstrap" if build.head? || build.devel?
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
