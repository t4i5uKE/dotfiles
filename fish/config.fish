. ~/.config/fish/aliases.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
    # nodenv
    source (nodenv init -|psub)
end

# asdf
source /usr/local/opt/asdf/asdf.fish

# golang
set -x GOPATH $HOME/go
set -x PATH $PATH $GOPATH/bin

# google cloud sdk
# The next line updates PATH for the Google Cloud SDK.
source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc'
bass source '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc'


# command history (ctrl + Y)
bind \cy __fzf_reverse_isearch_with_copy

# $fish_user_paths
set -x PATH /usr/local/bin $PATH
