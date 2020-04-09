#!/bin/bash
##### a bash script for new os use with : bash 0_start
######################################################################
GTK=false
PYTHON=false

while test $# -gt 0; do
  case "$1" in
    gtk)
      shift
      GTK=true
    ;;
    python)
      shift
      PYTHON=true
    ;;
  esac
done
######################################################################
sudo apt update

sudo apt install -y \ #some preinstalled, but just to make sure
	tmux wget curl openvpn openconnect vim htop git openssh-server\
	docker.io docker-compose \
	python3 python3-dev python3-venv \
	ubuntu-restricted-extras \
	tor privoxy obfs4proxy
#############################
if $GTK ; then

#sudo apt install -y \
#	xorg xinit
#	ubutnu-dekstop

### removing some apps if exist 
sudo apt remove -y firefox eog
sudo snap install firefox eog vlc telegram-desktop #evince gimp libreoffice audacity

sudo apt remove -y gedit totem rhythmbox file-roller #yelp
sudo snap remove gnome-calculator gnome-system-monitor

### install required packages
sudo apt install -y \
gnome-terminal thunderbird nautilus evince cheese \
gnome-screenshot gnome-tweak-tool brasero vim-gtk \
xclip
#gimp libreoffice openshot
fi

<<<<<<< HEAD
sudo apt install -y git tmux wget openconnect htop xclip vim
sudo apt install -y ubuntu-restricted-extras


=======
>>>>>>> 24d1d61dd0c9ba131f0e8a68bb952aa65e3e04bd
### make sure everything is uptodate
sudo apt -y upgrade

######################################################################
### rc files
cp cli/bashrc ~/.bashrc

if $GTK; then
  cat gtk/vimrc-gtk >> ~/.vimrc
fi
### config git
git config --global user.name 'm-yosefpor'
git config --global user.email 'myusefpur@gmail.com'
git config --global core.editor vim
git config --global merge.tool vimdiff
### config tor
cat torrc | sudo tee -a /etc/tor/torrc >/dev/null
echo "forward-socks5 / 127.0.0.1:9050 ." > ~/.privoxy.conf
#### apps and defaults
if $GTK ; then
	sudo cp gtk/nvlc.desktop /usr/share/applications/nvlc.desktop
	cp gtk/mimeapps.list ~/.config/mimeapps.list
fi
######################################################################
rmdir ~/Music ~/Videos ~/Pictures ~/Documents ~/Public ~/Templates

##################### python3 modules
if $PYTHON; then
  python3 -m venv ~/py-venv
  . ~/py-venv/bin/activate
  ### need a vpn
  pip install wheel
  pip install numpy
  pip install scipy
  pip install pandas
  pip install matplotlib
  pip install numba
  pip install sympy
  pip install cython
  pip install sklearn
  pip install tensorflow
  pip install qutip
  pip install jupyter
  deactivate
fi
########
#ssh-keygen -t rsa -b 4096 -C "myusefpur@gmail.com"
#eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_rsa
###
#xclip -sel clip < ~/.ssh/id_rsa.pub
## add ssh-key to github accoutn : #setting # ssh and gpg key # add ssh key

#################### vundle install and jedi-vim auto completion
#git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
#vim +PluginInstall +qall

#################### installing by file
#cp app/dropbox /opt/dropbox
#ln -s /opt/dropbox/dropbox.py /usr/local/bin/dropbox 'dropbox'


