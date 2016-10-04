class P4Completion < Formula
  desc "P4 Bash Completion"
  head "https://github.com/zachwhaley/p4-completion.git"
  url "https://github.com/zachwhaley/p4-completion/archive/v1.0.tar.gz"
  sha256 "e64d54375bd021b19392b6065ceba31507f93686a8df0589e4071f424cad8579"
  depends_on "bash-completion"

  def install
    FileUtils.install "p4-completion.sh", "#{etc}/bash_completion/p4", :mode => 0444
  end
end
