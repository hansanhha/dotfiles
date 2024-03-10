# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# zsh theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# command execution time configuration(history command output)
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# configuration custom folder than $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins : $ZSH/plugins/
# Custom plugins : $ZSH_CUSTOM/plugins/
plugins=(
	git
	zsh-autosuggestions
	zsh-completions
	zsh-syntax-highlighting
	asdf
)

source $ZSH/oh-my-zsh.sh
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# langauge environment 
export LANG=en_US.UTF-8

# local, remote editor setup
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
else
  export EDITOR='vim'
  export VISUAL='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# alias
if [ -f ~/.zsh_aliases ]; then
	. ~/.zsh_aliases
fi

# login user path environment variable setup 
export PATH=$PATH:$HOME/.local/bin

# fzf configuration
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export FZF_DEFAULT_OPTS='--extended --cycle --multi --height=60% --layout=reverse --prompt="finder > " --inline-info'
export FZF_DEFAULT_OPTS='
  --color=fg:#63d250,fg+:#d0d0d0,bg:#151212,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#ffffff
  --color=prompt:#aa088a,spinner:#000dff,pointer:#af5fff,header:#87afaf
  --color=border:#787878,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="finder > "
  --marker=">" --pointer="◆" --separator="─" --scrollbar="|"
  --inline-info --layout=reverse --multi --height=60%
  --preview="bat --style=numbers --color=always {}"
  '
export FZF_COMPLETION_OPTS='--info=inline'
