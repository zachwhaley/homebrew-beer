class P4Completion < Formula
  desc "P4 Bash Completion"
  head "https://github.com/zachwhaley/p4-completion.git"
  url "https://github.com/zachwhaley/p4-completion/archive/v2.0.tar.gz"
  sha256 "0a033dca214005f5523dba75a49f62b1146a6efd0efe03b9f0783e76bbad1896"
  depends_on "bash-completion"

  def install
    FileUtils.install "p4-completion.sh", "#{etc}/bash_completion/p4", :mode => 0444
  end
end
