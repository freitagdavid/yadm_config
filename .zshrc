ZSH_THEME="agnoster"

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
	source "${conf}"
done
unset conf

zstyle ':omz:update' mode auto # update automatically without asking
zstyle ':omz:update' frequency 1
zstyle ':omz:lib:theme-and-appearance' gnu-ls yes

plugins=(
	git
	git-auto-fetch
	gitfast
	asdf
	zsh-autosuggestions
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# # Compilation flags
# export ARCHFLAGS="-arch arm64 -arch x86_64"

. "$HOME/.asdf/asdf.sh"
# . ~/.config/zsh/config.d/extraterm-commands-0.75.0/setup_extraterm_zsh.zsh

##################################################
##                General Helpers               ##
##################################################

ASDF_PYTHON_PATCH_URL="https://github.com/python/cpython/commit/8ea6353.patch?full_index=1"

# Import *.zsh includes
function rld() {
	source ~/.zshrc
}

# Import auth tokens and whatnot
source ~/.secrets

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"