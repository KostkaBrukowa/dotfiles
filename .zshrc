source "$HOME/.slimzsh/slim.zsh"
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='vim'
 fi

plugins=(
  brew
  git
  npm
  yarn
  zsh-autosuggestions
)

alias gs="git status"
alias gb="git branch"
alias gpl="git pull"
alias gph="git push"
alias gst="git stash"
alias gd="git diff"
alias ga="git add -i"
alias ga.="git add ."
alias gc="git checkout"
alias gct="git commit -m"
alias gcta="git commit --amend"
alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset - %s %Cgreen(%cr)%C(red)%d%Creset %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gfa="git fetch --all"

alias rd="npm run dev"
alias rt="npm t"
alias rtu="npm run test:unit"
alias rte="npm run build && npm run test:e2e"

alias yt="yarn run test"
alias ytc="yarn run typecheck"
alias yl="yarn run lint"
alias yta="yt && yl && ytc"
alias yst="yarn start"
alias yss="yarn stop && yarn start"
alias ystp="yarn stop"
alias yrst="yarn stop && yarn && yarn start"
alias yyst="yarn && yarn start"
alias cdp=""

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
