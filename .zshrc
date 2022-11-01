ZSH_THEME="robbyrussell"

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
	source "${conf}"
done
unset conf

zstyle ':omz:update' mode auto # update automatically without asking
zstyle ':omz:update' frequency 13

plugins=(git asdf)

source $ZSH/oh-my-zsh.sh

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

. /usr/local/opt/asdf/libexec/asdf.sh

##################################################
##                General Helpers               ##
##################################################

function rld() {
	source ~/.zshrc
}

# Import *.zsh includes
