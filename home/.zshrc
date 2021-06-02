if [ -d $HOME/.zfunc ];then
	fpath+=~/.zfunc
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
	print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
	command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
	command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
		print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
		print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
	### End of Zinit's installer chunk
zinit ice blockf; zinit light zsh-users/zsh-completions
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git 

if [[ `command -v starship` ]]; then
	eval "$(starship init zsh)"

fi

if [[ `command -v zoxide` ]]; then
	eval "$(zoxide init zsh)"
fi
## if not bindkey -e ,in tmux will work wrong 
bindkey -e
source ~/.profile

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# zsh-completions script need append before compinit
#if type brew &>/dev/null; then
#FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	#autoload -Uz compinit
	#compinit
	#fi


alias luamake=/Users/zaki/.config/lua-language-server/3rd/luamake/luamake
