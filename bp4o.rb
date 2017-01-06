class Bp4o < Formula
  desc "Better P4 Output"
  homepage "http://zachwhaleys.website/bp4o/"
  head "https://github.com/zachwhaley/bp4o.git"
  url "https://github.com/zachwhaley/bp4o/archive/v1.1.1.tar.gz"
  sha256 "6fe706e17fac2ab8cea8d4e41714f5ce66683f9382ea92f1064c85ffb196db39"

  def install
    bin.install Dir["bin/*"]
    (prefix/"etc/profile.d").install "bp4o.bash" => "bp4o.sh"
    zsh_function.install "bp4o.zsh" => "bp4o"
    fish_function.install "bp4o.fish" => "p4.fish"
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
    # Test Bash
    system "bash", "-c", ". #{HOMEBREW_PREFIX}/etc/profile.d/bp4o.sh && p4 help bp4o"

    # Test Zsh
    system "zsh", "-c", "autoload -Uz bp4o && bp4o && p4 help bp4o"

    # Test Fish
    if which("fish")
      system "fish", "-c", "p4 help bp4o"
    end
  end
end
