class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v0.3.1.tar.gz"
  sha256 "a4cb998068e1d980231ee0f5386fe72eb42b823c4f4bed8209ecbca1de182d61"

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
