. ~/.config/fish/aliases.fish

if status is-interactive
    # nodenv
    source (nodenv init -|psub)
end

# asdf
source /usr/local/opt/asdf/asdf.fish

# golang
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# command history (ctrl + Y)
bind \cy __fzf_reverse_isearch_with_copy

# $fish_user_paths
set -x PATH /usr/local/bin $PATH
