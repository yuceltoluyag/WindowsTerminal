# -------------------------------- General ---------------------------------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="cloud"
plugins=(git zsh-autosuggestions fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
PATH="$HOME/.script:$PATH"
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export GPG_TTY=$(tty)
# -------------------------------- Alias ---------------------------------
alias vi='nvim'
alias vim='nvim'
alias guncelle='sudo pacman -Syyu && yay -Syu'
alias aynalar="sudo reflector --country Germany --age 12 --latest 5 --protocol http,https --sort rate --download-timeout 10 --verbose --save /etc/pacman.d/mirrorlist"
alias temizle='sudo pacman -Sc $(pacman -Qdtq)'
alias ptemiz='sudo pacman -Rs $(pacman -Qtdq)'
alias hata='systemctl --failed'
alias hatalog='journalctl -p 3 -xb'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias diff='diff --color=auto'

# -------------------------------- FUNCTIONS ---------------------------------
function lazygit() {
    git status .
    git add .
    git commit -S -m "$1"
    git push -u origin "$2"
}

function find() {
    if [ $# = 1 ];
    then
        command find . -iname "*$@*"
    else
        command find "$@"
    fi
}
