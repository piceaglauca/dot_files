# Most things taken from:
# https://callstack.com/blog/supercharge-your-terminal-with-zsh/
#
# Also might be good: https://opensource.com/article/18/9/tips-productivity-zsh

bindkey -v # enable vim emulation
bindkey '^R' history-incremental-search-backward

autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
	compinit -i
else
	compinit -C -i
fi

zmodload -i zsh/complist

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

setopt hist_ignore_all_dups # remove older duplicate entries from history
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell

#setopt correct_all # autocorrect commands (typos)

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

zstyle ':completion:*' menu select # select completions with arrow keys
zstyle ':completion:*' group-name '' # group results by category
#zstyle ':completion:::::' completer _expand _complete _ignored _approximate # enable approximate matches for completion

bindkey '^[[3~' delete-char # fix delete key
bindkey '^[3;5~' delete-char

alias ls='ls --color=tty'
alias grep='grep --color=auto'

setopt autopushd

RPROMPT='%B%F{red}%*%f%b'
PROMPT='%B%? %F{blue}%m%f %F{green}%~%#%b%f '

#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
if [ "TEST$(echo $PATH | grep -o $HOME/.local/bin)" = "TEST" ]; then
	export PATH="$PATH:$HOME/.local/bin"
fi
if [ "TEST$(echo $PATH | grep -o $HOME/bin)" = "TEST" ]; then
	export PATH="$PATH:$HOME/bin"
fi

#alias snrcmm='xfreerdp /u:scott.howard -v:10.10.200.4 /clipboard /fonts /multimon'
#alias snrc='xfreerdp /u:scott.howard -v:10.10.200.4 /clipboard /fonts /f'
#alias snrcup='nmcli con up id SNRC'
#alias snrcdown='nmcli con down id SNRC'
