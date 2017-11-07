#!/bin/bash
OPTION=${1:-all}
if [ ! -d "$HOME/.zgen" ] ; then
    git clone https://github.com/tarjoilija/zgen.git "$HOME/.zgen"
fi


curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$HOME/.config/nvim"
if [ $OPTION == "mini" ] ; then
    ln -s "$HOME/dotfiles/vimrc.mini" "$HOME/.vimrc"
    ln -s "$HOME/dotfiles/vimrc.mini" "$HOME/.config/nvim/init.vim"
else
    ln -s "$HOME/dotfiles/vimrc" "$HOME/.vimrc"
    ln -s "$HOME/dotfiles/vimrc" "$HOME/.config/nvim/init.vim"
fi
ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -s "$HOME/dotfiles/tmux.conf" "$HOME/.tmux.conf"
ln -s "$HOME/dotfiles/editorconfig" "$HOME/.editorconfig"

nvim +PlugInstall +:qall
vim +PlugInstall +:qall

source "$HOME/.zshrc"

