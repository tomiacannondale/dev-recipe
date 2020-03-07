execute "install pt(the_platinum_searcher)" do
  not_if "test -e /usr/local/bin/pt"

  command <<-SHELL
    wget https://github.com/monochromegane/the_platinum_searcher/releases/download/v2.2.0/pt_linux_amd64.tar.gz
    tar zxvf pt_linux_amd64.tar.gz
    mv pt_linux_amd64/pt /usr/local/bin
  SHELL
end
