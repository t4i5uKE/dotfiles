BINDIR=/usr/bin
DOTFILES_DIR=$(shell pwd)
VSCODE_SETTING_DIR=~/Library/Application\ Support/Code/User

.PHONY: help
help: ## Display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_0-9-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ setup

.PHONY: setup
setup-macos: setup-brew setup-zsh setup-vim setup-vscode create-symbolic-link ## Set up a MacOS development environment

##@ symbolic-link
.PHONY: symbolic-link
create-symbolic-link:
	ln -s $(DOTFILES_DIR)/.bashrc ~/.bashrc
	ln -s $(DOTFILES_DIR)/.gitconfig ~/.gitconfig
	ln -s $(DOTFILES_DIR)/.gitignore ~/.gitignore
	ln -s $(DOTFILES_DIR)/.profile ~/.profile
	ln -s $(DOTFILES_DIR)/.tmux.conf ~/.tmux.conf
	ln -s $(DOTFILES_DIR)/topgrade.toml ~/.config/topgrade.toml
	ln -s $(DOTFILES_DIR)/starship.toml ~/.config/starship.toml

##@ tools

.PHONY: setup-brew
setup-brew: brew ## Set up Homebrew
	brew bundle --file $(shell pwd)/Brewfile
	ln -s $(DOTFILES_DIR)/Brewfile ~/Brewfile

.PHONY: setup-zsh
setup-zsh: zinit ## Set up Zsh
	ln -s $(DOTFILES_DIR)/.zsh ~/.zsh
	ln -s $(DOTFILES_DIR)/.zshrc ~/.zshrc
	ln -s $(DOTFILES_DIR)/.zprofile ~/.zprofile
	sudo echo "/usr/local/bin/zsh" >> /usr/shells

.PHONY: setup-vim
setup-vim: vim-plug ## Set up Vim
	ln -s $(DOTFILES_DIR)/.vimrc ~/.vimrc 

.PHONY: setup-vscode
setup-vscode: ## Set up VSCode
	ln -s $(DOTFILES_DIR)/settings.json $(VSCODE_SETTING_DIR)/settings.json
	cat extensions | while read line \
	do \
	code --install-extension $line \
	done \
	code --list-extensions > extensions

##@ install

.PHONY: brew
brew: ## Install Homebrew
	$(BINDIR)/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)

.PHONY: zinit
zinit: ## Install Zinit
	sh -c "$(curl -fsSL https://git.io/zinit-install)"

.PHONY: vim-plug
vim-plug: ## Install Vim-Plug
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
