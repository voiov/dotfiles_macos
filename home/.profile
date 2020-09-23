# Make sure this file only source once
if [ -z $_SET_PROFILE];then
	_SET_PROFILE=1


# set rust
if [ -f $HOME/.cargo/env ];then
	source	$HOME/.cargo/env
fi

# alias
if [[ `command -v typora` ]]; then
	alias	typora="open -a typora"
fi
if [[ `command -v fzf` ]]; then
	alias	preview="fzf --preview 'bat --color \"always\" {}'"
fi

# Set ENV
export	PATH=$PATH:$HOME/.local/bin
export	FZF_DEFAULT_OPTS="--bind='ctrl-o:execute(vim {})+abort'"
# 支持在 VS Code 里用 ctrl+o 来打开选择的文件
export	EDITOR="vim"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
# Flow keyword "fi" is the first line's end flag, MUSTN'T delete
fi

# HOMESHICK
export HOMESHICK_DIR=/usr/local/opt/homeshick
source "/usr/local/opt/homeshick/homeshick.sh"

#if [[ `command -v task` ]]; then
	#task next
#else if [[ `command -v tb` ]]; then
	#echo "==================== TO DO ===================="
	#tb --timeline
	#echo "==================== TO DO ===================="
#fi
#fi
