. ~/.config/fish/aliases.fish

# starship
starship init fish | source

# asdf
source /usr/local/opt/asdf/asdf.fish

# google-cloud-sdk
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc

# krew (kubectl plugin)
set -gx PATH $PATH $HOME/.krew/bin

# golang
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# nodenv
eval (nodenv init - | source)

# csharp
set -x PATH /usr/local/share/dotnet:$PATH
set -x MONO_GAC_PREFIX /usr/local

# command history (ctrl + Y)
bind \cy __fzf_reverse_isearch_with_copy

# $fish_user_paths
set -x PATH /usr/local/bin $PATH
