source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/svn
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/vundle
    zgen oh-my-zsh plugins/cp
    zgen oh-my-zsh themes/robbyrussell
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load rupa/z
    zgen load mahmoudelbadry/zsh-aliases
    zgen load mahmoudelbadry/zsh-mkcd
    zgen load mahmoudelbadry/zsh-svn
    zgen load mahmoudelbadry/zsh-launch
    zgen load Tarrasch/zsh-bd
    zgen save
fi
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

export PATH=$PATH:/home/bedo/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/bedo/.rvm/bin
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/android/sdk/tools:$PATH
export PATH=$HOME/android/sdk/platform-tools:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR=nvim
source ~/.nvm/nvm.sh
alias betty=/home/bedo/betty/main.rb
alias nv=nvim

rvm default
stty -ixon

[ -s "/home/bedo/.kre/kvm/kvm.sh" ] && . "/home/bedo/.kre/kvm/kvm.sh" # Load kvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
