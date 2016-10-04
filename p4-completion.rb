class P4Completion < Formula
  desc "P4 Bash Completion"
  head "https://github.com/zachwhaley/p4-completion.git"
  url "https://github.com/zachwhaley/p4-completion/archive/v1.1.tar.gz"
  sha256 "5153ce475f314751548c8a44ed63d74d85a5b177fcd335fcd6d5e992169f963f"
  depends_on "bash-completion"

  def install
    FileUtils.install "p4-completion.sh", "#{etc}/bash_completion/p4", :mode => 0444
  end
end
