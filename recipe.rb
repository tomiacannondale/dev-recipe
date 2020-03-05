# for install ruby (https://github.com/rbenv/ruby-build/wiki)
package "autoconf"
package "bison"
package "build-essential"
package "libssl-dev"
package "libyaml-dev"
package "libreadline6-dev"
package "zlib1g-dev"
package "libncurses5-dev"
package "libffi-dev"
# package "libgdbm"
package "libgdbm-dev"

package "git"
package "zsh"
package "cmigemo"
package "graphviz"
package "fonts-ricty-diminished"
package "w3m"
package "peco"
package "source-highlight"
package "wget"
package "jq"
package "redis"
package "mysql-client-5.7"

# another method of installation
# package "chromedriver"
# package "google-chrome"
# package "the_platinum_searcher"

# for rails(maybe)
package "libsqlite3-dev"
package "libmysqld-dev"

include_recipe "docker::install"

execute "clone zsh.d" do
  not_if "test -e $HOME/.zshrc"
  user "ishiduka"

  command <<-SHELL
    git clone #{node[:zshd][:repository]} $HOME/.zsh.d
    ln -s $HOME/.zsh.d/zshrc $HOME/.zshrc
  SHELL
end

execute "install anyenv" do
  not_if "test -e $HOME/.anyenv/bin/anyenv"
  user 'ishiduka'
  command <<-"SHELL"
    git clone https://github.com/anyenv/anyenv $HOME/.anyenv
    mkdir $HOME/.anyenv/plugins
    git clone https://github.com/znz/anyenv-update.git $HOME/.anyenv/plugins/anyenv-update
  SHELL
end

# emacs
git "#{node[:homed][:path]}/.emacs.d" do
  repository node[:emacsd][:repository]
  user "ishiduka"
end

directory "#{node[:homed][:path]}/.emacs.d/elisp" do
  user "ishiduka"
end

git "#{node[:homed][:path]}/.emacs.d/elisp/exec-path-from-shell" do
  repository "https://github.com/purcell/exec-path-from-shell"
  user "ishiduka"
end

package "texinfo"
package "libx11-dev"
package "libxpm-dev"
package "libjpeg-dev"
package "libpng-dev"
package "libgif-dev"
package "libtiff-dev"
package "libgtk-3-dev"
package "gnutls-bin"
package "libgnutls28-dev"

execute "install emacs" do
  not_if "test -e /usr/local/bin/emacs"
  command <<-"SHELL"
  wget http://ftp.jaist.ac.jp/pub/GNU/emacs/emacs-26.3.tar.gz
  tar zxvf emacs-26.3.tar.gz
  cd emacs-26.3
  ./configure --with-x
  make
  make install
  SHELL
end
