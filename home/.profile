# Make sure this file only source once
if [ -z $_SET_PROFILE];then
	_SET_PROFILE=1

#This tells zsh that small letters will match small and capital letters. (i.e. capital letters match only capital letters.)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Do menu-driven completion.
zstyle ':completion:*' menu select
# formatting and messages

#zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# http://www.masterzen.fr/2009/04/19/in-love-with-zsh-part-one/
zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''


# set rust
if [ -f $HOME/.cargo/env ];then
	source	$HOME/.cargo/env
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ `command -v fzf` ]]; then
	alias	preview="fzf --preview 'bat --color \"always\" {}'"
fi

if [[ `command -v exa` ]]; then
	alias	ls="exa"
	alias   l="ls -l  -h -T -L1"
	alias   ll="ls -l -a  -G"
	alias   l1="ls -l -h -T -L1"
	alias	l2="ls -l -h -T -L2"
	alias	l3="ls -l -h -T -L3"
	alias	lt="l2"
fi

if [[ `command -v nvim` ]]; then
	alias	vi=nvim
	alias	vim=nvim
fi

# Set ENV
export	PATH="$PATH:$HOME/.local/bin"
export	PATH="/usr/local/sbin:$PATH"
export	FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
# 支持在 VS Code 里用 ctrl+o 来打开选择的文件
export	EDITOR="nvim"

# HOMESHICK
export HOMESHICK_DIR=/usr/local/opt/homeshick
source "/usr/local/opt/homeshick/homeshick.sh"

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit
fi

alias ..="cd ./.."
alias -- -="cd -"
alias md='mkdir -p'
alias rd=rmdir

## Flow keyword "fi" is the first line's end flag, MUSTN'T delete
fi
