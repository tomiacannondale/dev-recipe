execute "install anyenv" do
  not_if "test -e $HOME/.anyenv/bin/anyenv"
  user 'ishiduka'
  command <<-"SHELL"
    git clone https://github.com/anyenv/anyenv $HOME/.anyenv
    mkdir $HOME/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
  SHELL
end
