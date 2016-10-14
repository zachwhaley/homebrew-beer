class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v0.3.2.tar.gz"
  sha256 "80c370c8359273c6f789858a804a6179ecd87ae1de8b5108363f8d66ad2677f0"

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
