### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

# setUp
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

# history
zinit light zsh-users/zsh-history-substring-search
# 256Color
zinit light "chrissicool/zsh-256color"
# b4b4r07
zinit ice proto'git' pick'init.sh'
zinit light b4b4r07/enhancd

### End of Zinit's installer chunk
# Read .zshrc.*
[[ -f $HOME/.zsh/.zshrc.common ]] && source $HOME/.zsh/.zshrc.common
[[ -f $HOME/.zsh/.zshrc.alias ]] && source $HOME/.zsh/.zshrc.alias

# starship
eval "$(starship init zsh)"

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# nodenv
eval "$(nodenv init -)"

# google-cloud-sdk
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# rust
source $HOME/.cargo/env

# kubectl
source <(kubectl completion zsh)

# helm
source <(kubectl completion zsh)

# fzf
export FZF_CTRL_T_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --style=header,grid --line-range :100 {}"'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# broot
source /Users/morero/.config/broot/launcher/bash/br
