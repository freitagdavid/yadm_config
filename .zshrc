ZSH_THEME="agnoster"

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
	source "${conf}"
done
unset conf

zstyle ':omz:update' mode auto # update automatically without asking
zstyle ':omz:update' frequency 13

plugins=(
	git 
	asdf
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

. /usr/local/opt/asdf/libexec/asdf.sh

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

