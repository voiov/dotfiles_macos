# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
	source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
zinit light-mode for \
	zsh-users/zsh-autosuggestions\
	zdharma/fast-syntax-highlighting
	### End of Zinit's installer chunk
	zinit ice depth=1; zinit light romkatv/powerlevel10k

	zinit ice blockf; zinit light zsh-users/zsh-completions

	zinit snippet OMZL::git.zsh
	zinit snippet OMZP::git 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if [[ `command -v starship` ]]; then
	eval "$(starship init zsh)"

fi

if [[ `command -v zoxide` ]]; then
	eval "$(zoxide init zsh)"
fi

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

