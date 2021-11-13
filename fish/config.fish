. ~/.config/fish/aliases.fish

if status is-interactive
    # nodenv
    source (nodenv init -|psub)
end

# asdf
source /usr/local/opt/asdf/asdf.fish

# krew (kubectl plugin)
set -gx PATH $PATH $HOME/.krew/bin

# golang
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# csharp
set -x PATH /usr/local/share/dotnet:$PATH

# command history (ctrl + Y)
bind \cy __fzf_reverse_isearch_with_copy

# $fish_user_paths
set -x PATH /usr/local/bin $PATH
