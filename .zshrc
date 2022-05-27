if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod g-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi
# examples here -> https://z.digitalclouds.dev/docs/ecosystem/annexes
zicompinit # <- https://z.digitalclouds.dev/docs/guides/commands

zi wait lucid light-mode for \
    atinit"typeset -gA FAST_HIGHLIGHT; FAST_HIGHLIGHT[git-cmsg-len]=100; zpcompinit; zpcdreplay" \
        zdharma-continuum/fast-syntax-highlighting \
    atinit"ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20" atload"!_zsh_autosuggest_start" \
        zsh-users/zsh-autosuggestions \
    light-mode blockf atpull'zinit creinstall -q .' \
    atinit"
        zstyle ':completion:*' completer _expand _complete _ignored _approximate
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
        zstyle ':completion:*' menu select=2
        zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
        zstyle ':completion:*:descriptions' format '-- %d --'
        zstyle ':completion:*:processes' command 'ps -au$USER'
        zstyle ':completion:complete:*:options' sort false
        zstyle ':fzf-tab:*' fzf-command fzf
        zstyle ':fzf-tab:complete:_zlua:*' query-string input
        zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath' 
    " \
        zsh-users/zsh-completions \

# b4b4r07
zi ice wait'1' lucid pick'init.sh'; zinit light "b4b4r07/enhancd"
zi ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
zi light b4b4r07/httpstat
# Aloxaf
zi light Aloxaf/fzf-tab

### End of Zinit's installer chunk

# starship
eval "$(starship init zsh)"

# asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# nodenv
eval "$(fnm env --use-on-cd)"

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
export FZF_DEFAULT_OPTS="--prompt '🔎 ' --marker=+ --color=dark --layout=reverse --color=fg:250,fg+:15,hl:203,hl+:203 --color=info:100,pointer:15,marker:220,spinner:11,header:-1,gutter:-1,prompt:15"
export FZF_CTRL_T_COMMAND='fd --hidden --follow | rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_OPTS='--preview "bat --color=always --style=header,grid --line-range :100 {}"'
export FZF_COMPLETION_OPTS="-x"
_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
_fzf_compgen_dir() {
    fd --type d --hidden --follow . "$1"
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Read .zshrc.*
[[ -f $HOME/.zsh/.zshrc.common ]] && source $HOME/.zsh/.zshrc.common
[[ -f $HOME/.zsh/.zshrc.alias ]] && source $HOME/.zsh/.zshrc.alias
