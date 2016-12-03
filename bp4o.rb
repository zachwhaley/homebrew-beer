class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v1.0.0.tar.gz"
  sha256 "13255e5a47e7fe3caa0d26fcf447e179420aa1def4e87201657a7ce845acdb51"

  def install
    bin.install Dir["bin/*"]
    (prefix/"etc/profile.d").install "bp4o.bash" => "bp4o.sh"
    (share/"zsh/site-functions").install "bp4o.zsh" => "bp4o"
    (share/"fish/vendor_functions.d").install "bp4o.fish" => "p4.fish"
  end

  def caveats; <<-EOS.undent
    Bash users, add the following to your ~/.bash_profile:
      if [ -f $(brew --prefix)/etc/profile.d/bp4o.sh ]; then
        . $(brew --prefix)/etc/profile.d/bp4o.sh
      fi

    Zsh users, add the following to your ~/.zshrc:
      autoload -Uz bp4o
      bp4o
    EOS
  end

  test do
    require 'mkmf'

    # Test Bash
    system "bash", "-c", ". #{HOMEBREW_PREFIX}/etc/profile.d/bp4o.sh && p4 help bp4o"

    # Test Zsh
    system "zsh", "-c", "autoload -Uz bp4o && bp4o && p4 help bp4o"

    # Test Fish
    if find_executable "fish"
      system "fish", "-c", "p4 help bp4o"
    end
  end
end
