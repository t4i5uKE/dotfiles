# lsd
alias ls lsd
alias l 'ls -l'
alias la 'ls -a'
alias lla 'ls -la'
alias lt 'ls --tree'

# quick edits
alias ev 'vim ~/.vimrc'
alias etmux 'vim ~/.tmux.conf'
alias efa 'vim ~/.config/fish/aliases.fish'
alias efc 'vim ~/.config/fish/config.fish'
alias sfc 'source ~/.config/fish/config.fish'

# clear
alias cls clear

# cli
alias k kubectl
alias h helm
alias i istioctl
alias d docker
alias gc gcloud

# docker
alias dclean 'docker rm -v (docker ps -a -q -f status=exited)'
alias dclean-none 'docker rmi (docker images -f "dangling=true" -q)'
