# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.zgenom/zgenom.zsh
zgenom autoupdate


if ! zgenom saved; then
    zgenom load romkatv/powerlevel10k powerlevel10k 
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load urbainvaes/fzf-marks
    zgenom load joshskidmore/zsh-fzf-history-search
    zgenom load zsh-users/zsh-syntax-highlighting
    zgenom load zsh-users/zsh-completions
    zgenom load zsh-users/zsh-autosuggestions
    zgenom save
fi
ZGENOM_RESET_ON_CHANGE=(${HOME}/.zshrc)
export GOPATH=$HOME/go
setopt nobgnice
export PATH=$PATH:/home/bedo/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/bedo/.rvm/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$HOME/local/bin:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/build-tools/27.0.3:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/linuxbrew/.linuxbrew/bin:$HOME/linuxbrew/.linuxbrew/sbin
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$HOME/flutter/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export EDITOR=nvim
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
alias nv=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
# alias show-cursor="find-cursor --repeat 0 --follow --distance 1 --line-width 16 --color rebeccapurple --size 16"

# rvm default
# stty -ixon

# [ -s "/home/bedo/.kre/kvm/kvm.sh" ] && . "/home/bedo/.kre/kvm/kvm.sh" # Load kvm


function apksign() {
    jarsigner -verbose -sigalg SHA1withRSA -digestalg SHA1 -keystore $2 $1 123
    zipalign -v 4 $1 $3
}

NVM_SYMLINK_CURRENT=true
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
alias cpf='cp -f'
#export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_191
export DENO_INSTALL="/home/mahmoud/.deno"
export PATH=$PATH:"$DENO_INSTALL/bin:$PATH"



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export XDG_DATA_DIRS=$XDG_DATA_DIRS:"$HOME/.local/share/flatpak/exports/share":"/var/lib/flatpak/exports/share"
cpv () {
        rsync -pogbr -hhh --inplace -e /dev/null --progress "$@"
}

source <(fzf --zsh)
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
alias ls='ls --color'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/home/mahmoud/.config/herd-lite/bin:$PATH"
export PATH="$PATH:/var/lib/flatpak/exports/bin"
alias codium='com.vscodium.codium'
export PHP_INI_SCAN_DIR="/home/mahmoud/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
alias sail='sh $([ -f sail ] && echo sail || echo vendor/bin/sail)'
