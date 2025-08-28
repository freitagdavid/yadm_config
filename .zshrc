# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
. "$HOME/.asdf/asdf.sh"

# Define variables for directories
export PATH=$HOME/.pnpm-packages/bin:$HOME/.pnpm-packages:$PATH
export PATH=$HOME/.npm-packages/bin:$HOME/bin:$PATH
export PATH=$HOME/.local/share/bin:$PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

for conf in "$HOME/.config/zsh/config.d/"*.zsh; do
  source "$conf"
done
unset conf

# Remove history data we don't want to see
export HISTIGNORE="pwd:ls:cd"

# Ripgrep alias
alias search=rg -p --glob '!node_modules/*' $@

# Emacs is my editor
export ALTERNATE_EDITOR=""
export EDITOR="nano"

# nix shortcuts
shell() {
  nix-shell '<nixpkgs>' -A "$1"
}

# Setup Bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm is a javascript package manager
alias pn=pnpm
alias px=pnpx

# PHP Deployer
alias deploy='dep deploy'

# Easy alias to trim whitespace from files on macOS
alias trimwhitespace="find . -type f \( -name '*.jsx' -o -name '*.php' -o -name '*.js' \) -exec sed -i \"\" 's/[[:space:]]*\$//' {} +"

# Use difftastic, syntax-aware diffing
alias diff=difft

# Always color ls and group directories
alias ls='ls --color=auto'

function rld() {
	source ~/.zshrc
}

export PATH=/opt/homebrew/opt/ccache/libexec:$PATH

# Import auth tokens and whatnot
source ~/.secrets

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

RUBY_CONFIGURE_OPTS="--with-openssl-dir=/opt/homebrew/opt/openssl@3"

# bun completions
[ -s "/Users/drfreitag/.bun/_bun" ] && source "/Users/drfreitag/.bun/_bun"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
