class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  url "https://github.com/zachwhaley/bp4o/archive/v0.2.2.tar.gz"
  sha256 "305379c8e5afd97924b91a17199f7fceec474448c59b44625532e9417e1d88b3"
  head "https://github.com/zachwhaley/bp4o.git"

  def install
    bin.install Dir["bin/*"]
    pkgshare.install Dir["./init.*"]
  end

  def post_install
    init = File.basename(ENV["SHELL"])
    ohai <<-EOS.undent
      BP4O Installed!
      Now add the following to your shell's rc file to setup BP4O on login

      [ -f /usr/local/share/bp4o/init.#{init} ] && source /usr/local/share/bp4o/init.#{init}
    EOS
  end
end
