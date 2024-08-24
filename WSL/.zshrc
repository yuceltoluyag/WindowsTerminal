# .zshrc

# Antidote'u kaynak olarak ekleyin
source /usr/share/zsh-antidote/antidote.zsh

# .zsh_plugins.txt dosyasını yükleyin
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt
# Tema ayarı (Lambda Mod teması)
export LAMBDA_MOD_N_DIR_LEVELS=10
# PATH ve Diğer Değişkenler
export npm_config_prefix="$HOME/.node_modules"
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export GPG_TTY=$(tty)

# PATH Tanımlamaları Birleştirildi
export PATH="$HOME/.script:$npm_config_prefix/bin:$GEM_HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# MAN Pages Neovim ile Açma
export MANPAGER='nvim +Man!'
export MANWIDTH=999

# Alias ve Fonksiyonlar
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

function lazygit() {
    git status .
    git add .
    git commit -S -m "$1"
    git push -u origin "$2"
}

function myfind() {
    if [ $# -eq 1 ]; then
        command find . -iname "*$1*"
    else
        command find "$@"
    fi
}

