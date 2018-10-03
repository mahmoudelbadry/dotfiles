source $HOME/.zgen/zgen.zsh

if ! zgen saved; then
    zgen oh-my-zsh
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/common-aliases
    zgen oh-my-zsh plugins/vundle
    zgen oh-my-zsh plugins/cp
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load rupa/z
    zgen load mahmoudelbadry/zsh-aliases
    zgen load mahmoudelbadry/zsh-mkcd
    zgen load mahmoudelbadry/zsh-svn
    zgen load mahmoudelbadry/zsh-launch
    zgen load Tarrasch/zsh-bd
    zgen load mafredri/zsh-async
    zgen load denysdovhan/spaceship-prompt spaceship
    zgen save
fi
ZGEN_RESET_ON_CHANGE=(${HOME}/.zshrc)

export PATH=$PATH:/home/bedo/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/bedo/.rvm/bin
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/Android/Sdk/tools:$PATH
export PATH=$HOME/Android/Sdk/platform-tools:$PATH
export PATH=$HOME/Android/Sdk/build-tools/25.0.3:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR=nvim
source ~/.nvm/nvm.sh
alias betty=/home/bedo/betty/main.rb
alias nv=nvim

rvm default
stty -ixon

[ -s "/home/bedo/.kre/kvm/kvm.sh" ] && . "/home/bedo/.kre/kvm/kvm.sh" # Load kvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function apksign() {
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $2 $1 123
    zipalign -v 4 $1 $3
}

