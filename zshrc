# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof

export CLICOLOR=1
export EDITOR=nvim
export FZF_ALT_C_COMMAND='fd --type d'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="--reverse --bind 'ctrl-space:toggle'"
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_INSTALL_UPGRADE=1
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=1
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home'
export KEYTIMEOUT=1
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LEIN_USE_BOOTCLASSPATH=no
export LSCOLORS="Gxfxcxdxbxegedabagacad"
export NNN_COLORS='2'
export NNN_PLUG='o:fzopen'
export PATH="/opt/apache-maven-3.6.3/bin:$PATH"

HISTFILE=~/.zsh_history
HISTSIZE=1000000000
SAVEHIST=1000000000
setopt appendhistory
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt no_histverify
setopt inc_append_history
setopt share_history

bindkey -v
set -o vi
setopt NO_NOMATCH # Make the caret work in git show HEAD^
bindkey '^R' history-incremental-search-backward
bindkey '^E' fzf-cd-widget
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/evalcache.zsh
_evalcache scmpuff init -s
_evalcache zoxide init zsh

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# alias h='http -p b'
alias -g dl='`docker ps -a | fzf -m | cut -c1-13`'
alias -g dll='`docker ps -l -q`'
alias -g ff='`fzf`'
alias -g gll='`git lls | fzf | cut -d " " -f 1`'
alias ag='rg'
alias agi='rg -i'
alias b='bat'
alias cloc='tokei'
alias cwd="pwd | tr -d '\n' | pbcopy"
alias d='docker'
alias dc='docker-compose'
alias dcud='docker-compose down --remove-orphans && docker-compose up -d'
alias dps='docker ps'
alias drm='docker rm -f -v'
alias drma='docker rm -f -v `docker ps -aq`'
alias ezh='nvim ~/.zshrc'
alias g='git'
alias gam='git commit -a -m'
alias gca='git commit --amend'
alias gcafu='git commit -a --fixup gll'
alias gcane='git commit --amend --no-edit'
alias gcfu='git commit --fixup gll'
alias gcl='git clone'
alias gcm='git commit -m'
alias gcob='git checkout -b'
alias gcoo='git checkout $(git branch --no-color | fzf)'
alias gcp='git cherry-pick'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdm='git diff master'
alias gdms='git diff master --stat'
alias gds='git diff --stat'
alias gls='git ls=log --pretty=format:"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate'
alias gm='git checkout master'
alias gm='git merge --no-ff'
alias go='hub browse'
alias gpf='git push --force'
alias gpr='git pull --rebase'
alias gprs='git pull --rebase --stat'
alias gps='git push'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbm='git rebase master'
alias grbr="git for-each-ref --sort=-committerdate refs/heads/ --format='%(committerdate:short) %(authorname) %(refname:short)'"
alias grc='git commit --amend --no-edit'
alias grca='git commit -a --amend --no-edit'
alias grsh='git reset --hard'
alias gsh='git show'
alias gshh='git show $(git lls | fzf | cut -d " " -f 1)'
alias gshs='git show --stat'
alias gst='git stash'
alias gstp='git stash pop'
alias h='xh'
alias hc='hub compare'
alias hv='xh -v'
alias javlaskitdns='sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder'
alias l='ls -alh'
alias lc='lein clean'
alias lf='lein fig:build'
alias lk='lein kaocha'
alias ll='ls -alh'
alias lr='lein repl'
alias mci='mvn clean install'
alias mcif='mvn -TC1 -DskipTests -Dcheckstyle.skip -Dmaven.antrun.skip clean install'
alias mcs='mvn checkstyle:checkstyle'
alias mif='mvn -TC1 -DskipTests -Dcheckstyle.skip -Dmaven.antrun.skip install'
alias n='FZF_DEFAULT_OPTS="" nvim'
alias nn='n -v `fzf -m`'
alias pbc='pbcopy'
alias pbp='pbpaste'
alias pgrbm='git checkout master && git pull --rebase && git checkout - && git rebase master'
alias rbi='git rebase -i $(git lls | fzf | cut -d " " -f 1)^'
alias rmr='rm -rf'
alias t='task'
alias tf='terraform'
alias tree='exa --tree'
alias tw='timew'
alias twt='timew summary 24hours'
alias tww='timew summary :week'
alias workdonetoday="git diff master@{yesterday} --stat -- . ':(exclude)*.edn'"

java14() { export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-14.0.2.jdk/Contents/Home' }
java16() { export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-16.jdk/Contents/Home' }
java17() { export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home' }
jv() {
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/Contents/Home/$(ls /Library/Java/JavaVirtualMachines | fzf)
  echo "JAVA_HOME switched to $JAVA_HOME"
}
dr() { docker run -it --rm $1 /bin/bash }
twc() {
  TIME="${1:-0}"
  timew '@1' continue "$TIME"mins ago
}
tws() {
  TIME="${1:-0}"
  timew stop "$TIME"mins ago
}

source ~/dotfiles/completion.zsh

# autoload -Uz compinit && compinit
autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
  compdump
else
  compinit -C
fi

# zprof
