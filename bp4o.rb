class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v0.3.0.tar.gz"
  sha256 "33fea23ee1efb6ac5ca7d36aeb9ad41a2062014ac2ece8d4f61daba4e0235913"

  def install
    bin.install Dir["bin/*"]
    pkgshare.install Dir["./init.*"]
  end

  def caveats
    shell = File.basename(ENV["SHELL"])
    init = <<-EOS.undent
      Add the following to your .#{shell}rc file to setup BP4O:

      [ -f /usr/local/share/bp4o/init.#{shell} ] && source /usr/local/share/bp4o/init.#{shell}
    EOS
    init
  end
end
