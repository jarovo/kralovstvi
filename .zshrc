#!/bin/zsh

# completion
autoload -U compinit
compinit

# correction
setopt correctall

# prompt
autoload -U promptinit
promptinit
#prompt gentoo
prompt adam2


#bindkey -v
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey "^[[7~" beginning-of-line
bindkey "^[Od" vi-backward-word
bindkey "^[Oc" vi-forward-word
bindkey "\e[3~" delete-char

bindkey "^R"                history-incremental-search-backward
bindkey "^S"                history-incremental-search-forward

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/jary/.zshrc'

# End of lines added by compinstall
#
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall

#
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=15000
SAVEHIST=15000

setopt inc_append_history
setopt share_history

# End of lines configured by zsh-newuser-install
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt autocd
setopt extendedglob

#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; done &)

alias ls="ls --color=tty"

export SUDO_ASKPASS=/usr/libexec/openssh/ssh-askpass

PATH="$HOME/.local/bin:/sbin/:/usr/sbin:$PATH"


alias grepresults="egrep 'Test status .*(Fail|Pass)'"
alias greppass="grep --color=never 'Test status .*Pass'"
alias grepfail="grep --color=never 'Test status .*Fail'"
alias nodate="sed -r 's/^[0-9]{4}-[0-9]{2}-[0-9]{2}//'"
alias notimedate="nodate | sed -r 's/^ [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}//'"
alias nodesc="sed 's/ - rest-Main - .* - Test status for test //'"
alias nojunk="nodesc | sed -r 's/^ *//'"
alias colourify='sed -e "s/\(.*TRACE.*\)/\x1b[31;1m&\x1b[0m/" -e "s/\(.*\(ERROR\|WARNING\).*\)/\x1b[30;41m&\x1b[0m/"'


nodate='s/^[0-9]{4}-[0-9]{2}-[0-9]{2}//'
notime='s/^ [0-9]{2}:[0-9]{2}:[0-9]{2},[0-9]{3}//'
nodesc='s/ - rest-Main - .* - Test status for test //'
nojunk='s/^ *//'
col_fail='s/Fail/\x1b[31;1m&\x1b[0m/'
col_pass='s/Pass/\x1b[32;1m&\x1b[0m/'
col_ERROR='s/ERROR/\x1b[31;1m&\x1b[0m/'

alias coulourify2='sed -e "s/(Fail|ERROR)/\x1b[31;1m&\x1b[0m/" -e "s/Pass/\x1b[32;1m&\x1b[0m/"'
export COLOURIFY='sed  -e s/^.*ERROR.*$/\x1b[1;37;41m&\x1b[0m/i -e s/^.*WARN.*$/\x1b[30;47m&\x1b[0m/'


xznc () { ssh "$1" "xz < $2" | xzcat };
last_testlog () { echo `ls -c1 /var/tmp/*Tests*.log | head -n1` };
export EDITOR="gvim -f"

export WORKON_HOME=$HOME/.virtualenvs
#source /usr/bin/virtualenvwrapper.sh

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip-python
# pip zsh completion end

[ -r .private/zshrc ] && . .private/zshrc
