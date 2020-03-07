## usage
### preparatoin

guest os

```
sudo apt-get install -y gcc make perl
# maybe only Virtualbox6.1
sudo apt-get install virtualbox-guest-x11
```

```
LANG=C xdg-user-dirs-gtk-update
sudo apt-get install -y openssh-server
```

host os

```
VBoxManage modifyvm "xubuntu" --natpf1 "guestssh,tcp,,2222,,22"
```

### run itamae &&

host os(run itamae)

```
bundle exec itamae ssh -u <guest os username> -h localhost -p 2222 roles/ubuntu.rb -y node.yml
```

guest os

```
$HOME/.anyenv/bin/anyenv init
$HOME/.anyenv/bin/anyenv install --force-init
chsh -s $(which zsh)
```
restart guest os

### after

guest os

```
anyenv install rbenv
anyenv install nodenv
# new terminal
rbenv install 2.7.0
nodenv install 12.16.1
```
