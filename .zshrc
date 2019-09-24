source "$HOME/.slimzsh/slim.zsh"

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

alias yt="yarn run test"
alias ytc="yarn run typecheck"
alias yl="yarn run lint"
alias yta="yt && yl && ytc"
alias cdp="cd /Users/jaroslaw.glegola/Documents/Praca/ad-ppc-campaign-editor-panel/frontend"


PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH

