source $HOME/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundles <<EOBUNDLES

# Bundles from the default repo (robbyrussell's oh-my-zsh).
git
svn
common-aliases
vundle
cp
vi-mode 


# Syntax highlighting bundle.
zsh-users/zsh-syntax-highlighting
rupa/z
mahmoudelbadry/zsh-aliases
mahmoudelbadry/zsh-mkcd
mahmoudelbadry/zsh-svn
mahmoudelbadry/zsh-launch
Tarrasch/zsh-bd

EOBUNDLES
# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

export PATH=$PATH:/home/bedo/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/bedo/.rvm/bin
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/android/sdk/tools:$PATH
export PATH=$HOME/android/sdk/platform-tools:$PATH
export PATH=$PATH:/usr/local/go/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
EDITOR=gvim
source ~/.nvm/nvm.sh
bindkey -M vicmd '?' history-incremental-search-backward
alias betty=/home/bedo/betty/main.rb

rvm default
stty -ixon

[ -s "/home/bedo/.kre/kvm/kvm.sh" ] && . "/home/bedo/.kre/kvm/kvm.sh" # Load kvm
