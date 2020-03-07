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
