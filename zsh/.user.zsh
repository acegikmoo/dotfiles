#  Startup 
# Commands to execute on startup (before the prompt is shown)
# Check if the interactive shell option is set
# if [[ $- == *i* ]]; then
#     # This is a good place to load graphic/ascii art, display system information, etc.
#     if command -v pokego >/dev/null; then
#         pokego --no-title -r 1,3,6
#     elif command -v pokemon-colorscripts >/dev/null; then
#         pokemon-colorscripts --no-title -r 1,3,6
#     elif command -v fastfetch >/dev/null; then
#         fastfetch --logo-type kitty
#     fi
# fi
# fastfetch.sh

#  Aliases 
# Override aliases here or in '~/.zshrc' (already set in .zshenv)

# # Helpful aliases
# alias c='clear'                                                        # clear terminal
# alias l='eza -lh --icons=auto'                                         # long list
# alias ls='eza -1 --icons=auto'                                         # short list
# alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
# alias ld='eza -lhD --icons=auto'                                       # long list dirs
# alias lt='eza --icons=auto --tree'                                     # list folder as tree
# alias un='$aurhelper -Rns'                                             # uninstall package
# alias up='$aurhelper -Syu'                                             # update system/package/aur
# alias pl='$aurhelper -Qs'                                              # list installed package
# alias pa='$aurhelper -Ss'                                              # list available package
# alias pc='$aurhelper -Sc'                                              # remove unused cache
# alias po='$aurhelper -Qtdq | $aurhelper -Rns -'                        # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
# alias vc='code'                                                        # gui code editor
# alias fastfetch='fastfetch --logo-type kitty'

alias a='anchor'
alias k='kubectl'
alias p='pnpm'
alias gp='git push'                                                      # Push changes
alias nd='npm run dev'                                                   # for running npm run dev 
alias pd='pnpm run dev'                                                   # for running npm run dev 
alias yd='yarn run dev'                                                   # for running yarn run dev 
alias cc='cargo check'
alias cr='cargo run'
alias ct='cargo test'
alias cb='cargo build'
alias gc='git commit'                                                    # git commit
alias gch='git checkout'
# alias vi='~/bin/kitty.sh'                                       #for nvim padding (custom neovim wrapper)
alias vl='vi src/lib.rs'
alias vm='vi src/main.rs'
alias ss='source ~/.zshrc'

# misc
alias db='echo DATABASE_URL=postgresql://postgres:cupcake@localhost:5432/db'
alias xtree="tree -L 3 -I '.*|node_modules'"
log2() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> ./log.md
}

# # Directory navigation shortcuts
# alias ..='cd ..'
# alias ...='cd ../..'
# alias .3='cd ../../..'
# alias .4='cd ../../../..'
# alias .5='cd ../../../../..'

# # Always mkdir a path (this doesn't inhibit functionality to make a single dir)
# alias mkdir='mkdir -p'

#  Plugins 
# manually add your oh-my-zsh plugins here
plugins=(
    "sudo"
    # "git"                     # (default)
    # "zsh-autosuggestions"     # (default)
    # "zsh-syntax-highlighting" # (default)
    # "zsh-completions"         # (default)
)

#  Environment Variables and PATHs 

export EDITOR=code

# Node Version Manager (NVM)
export NVM_DIR="$HOME/.config/nvm"

# Rust (cargo)
export PATH="$HOME/.cargo/bin:$PATH"

# Solana
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# Foundry
export PATH="$HOME/.foundry/bin:$PATH"

# Go
export PATH="$PATH:$(go env GOPATH)/bin"

# Other environment variables
export LIBVA_DRIVER_NAME=iHD

# Node Version Manager (NVM) sources
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Pyenv initialization
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Enable autopair plugin for automatic closing of quotes/brackets
source ~/.zsh/zsh-autopair/autopair.zsh

