require "formula"

class Compute < Formula
  homepage "http://agordon.github.io/compute/"
  head "https://github.com/agordon/compute.git"
  url "https://github.com/agordon/compute/releases/download/v1.0.3/compute-1.0.3.tar.gz"
  sha1 "d61f5c4db955c93b3eaffdc80ee5ee4d21a690ab"

  if build.head?
    depends_on :autoconf => :build
    depends_on :automake => :build
    depends_on :gettext => :build
  end

  def install
    # Remove unrecognized options if warned by configure
    system "./configure", "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make"
    system "make", "check"
    system "make", "install"
  end

  test do
    system "true"
  end
end
