source $HOME/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle svn
antigen bundle common-aliases
# antigen bundle aliases
antigen bundle vundle
antigen bundle cp
antigen bundle vi-mode 


# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle rupa/z
antigen bundle mahmoudelbadry/zsh-aliases
antigen bundle mahmoudelbadry/zsh-mkcd
antigen bundle mahmoudelbadry/zsh-svn

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

alias betty=/home/bedo/betty/main.rb

rvm default
