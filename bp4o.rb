class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v0.3.3.tar.gz"
  sha256 "c191e1376d1d4f9773e8ff994312d801ea917106a1e5f1111d1e60504d12d81d"

  def install
    bin.install Dir["bin/*"]
    prefix+"etc/profile.d".install {"bp4o.bash" => "bp4o.sh"}
    share+"zsh/site-functions".install {"bp4o.zsh" => "bp4o"}
  end

  def caveats
    if File.basename(ENV["SHELL"]) == "zsh"
      init = <<-EOS.undent
        Zsh users, add the following to your ~/.zshrc file:

          autoload -Uz bp4o
          bp4o
      EOS
      init
    end
  end
end
