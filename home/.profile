# Make sure this file only source once
if [ -z $_SET_PROFILE];then
	_SET_PROFILE=1

# set rust
if [ -f $HOME/.cargo/env ];then
	source	$HOME/.cargo/env
fi
# source zsh-autosuggestions
if [[ -f  /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
	source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh	
fi

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# fzf autocomplete
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# alias
#if [[ `command -v typora` ]]; then
	#alias	typora="open -a typora"
#fi

if [[ `command -v fzf` ]]; then
	alias	preview="fzf --preview 'bat --color \"always\" {}'"
fi

if [[ `command -v exa` ]]; then
	alias	ls="exa"
	alias   l="ls -l -h -G"
	alias   ll="ls -l -h"
fi
# Set ENV
export	PATH="$PATH:$HOME/.local/bin"
export	PATH="/usr/local/sbin:$PATH"
export	FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
# 支持在 VS Code 里用 ctrl+o 来打开选择的文件
export	EDITOR="nvim"

#if [[ "$(uname -s)" == "Linux" ]]; then BREW_TYPE="linuxbrew"; else BREW_TYPE="homebrew"; fi
#export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
#export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/${BREW_TYPE}-core.git"
#export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/${BREW_TYPE}-bottles"

## Flow keyword "fi" is the first line's end flag, MUSTN'T delete
fi

# HOMESHICK
export HOMESHICK_DIR=/usr/local/opt/homeshick
source "/usr/local/opt/homeshick/homeshick.sh"


alias ..="cd -"


#if [[ `command -v task` ]]; then
	#task next
#else if [[ `command -v tb` ]]; then
	#echo "==================== TO DO ===================="
	#tb --timeline
	#echo "==================== TO DO ===================="
#fi
#fi
