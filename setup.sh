#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/repos/dotfiles                    # dotfiles directory
olddir=~/repos/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc tmux.conf"    # list of files/folders to symlink in homedir

##########

sudo apt update
sudo apt install zsh tmux git python3 python3-pip lolcat cowsay fortune neovim curl -y
chsh -s /bin/zsh

mkdir -p ~/repos
cd ~/repos
git clone https://github.com/pfrcks/dotfiles

sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/nojhan/liquidprompt
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pip3 install neovim thefuck

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file $olddir/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

mkdir -p ~/.config/nvim
ln -s $dir/init.vim ~/.config/nvim/init.vim
vim +PlugInstall +qall
