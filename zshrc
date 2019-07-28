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
export GOPATH=$HOME/go
setopt nobgnice
export PATH=$PATH:/home/bedo/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/bedo/.rvm/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$HOME/local/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/current:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.linuxbrew/bin:$HOME/.linuxbrew/sbin
export PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR=nvim
export NVM_DIR="$HOME/.config"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
alias betty=/home/bedo/betty/main.rb
alias nv=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'

rvm default
stty -ixon

[ -s "/home/bedo/.kre/kvm/kvm.sh" ] && . "/home/bedo/.kre/kvm/kvm.sh" # Load kvm

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function apksign() {
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $2 $1 123
    zipalign -v 4 $1 $3
}

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/"
alias cpf='cp -f'
