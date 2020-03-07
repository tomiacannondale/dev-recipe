execute "clone zsh.d" do
  not_if "test -e $HOME/.zshrc"
  user "ishiduka"

  command <<-SHELL
    git clone #{node[:zshd][:repository]} $HOME/.zsh.d
    ln -s $HOME/.zsh.d/zshrc $HOME/.zshrc
  SHELL
end
