class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v0.3.3.tar.gz"
  sha256 "c191e1376d1d4f9773e8ff994312d801ea917106a1e5f1111d1e60504d12d81d"

  def install
    bin.install Dir["bin/*"]
    pkgshare.install Dir["./bp4o.*"]
  end

  def caveats
    shell = File.basename(ENV["SHELL"])
    init = <<-EOS.undent
      Add the following to your .#{shell}rc file to setup BP4O:

        [ -f /usr/local/share/bp4o/bp4o.#{shell} ] && source /usr/local/share/bp4o/bp4o.#{shell}
    EOS
    init
  end
end
