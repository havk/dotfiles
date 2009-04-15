export PATH="$PATH:$HOME/bin"
export PAGER=less

autoload zsh/terminfo

# prompt
smul="$terminfo[smul]" #start underline mode
rmul="$terminfo[rmul]" #stop underline mode
PROMPT="%n@%m %(!.#.\$) "
RPROMPT="(%{${smul}%}%~%{${rmul}%})"

# CLICOLOR makes 'ls' colorize its output
export CLICOLOR=1

#key binding
bindkey -e      # use emacs keymap
# Customize a bit the bindings
bindkey "$terminfo[kdch1]"    'delete-char'                     #Suppr
bindkey "$terminfo[khome]"    'beginning-of-line'               #Home key
bindkey "$terminfo[kend]"     'end-of-line'                     #End key
bindkey "$terminfo[kcuu1]" history-beginning-search-backward    #Up key
bindkey "$terminfo[kcud1]" history-beginning-search-forward     #Down key

#alias
alias ll="ls -l"

#Make 'cd' being in fact a 'pushd'
DIRSTACKSIZE=8
setopt autopushd pushdminus pushdsilent pushdtohome
alias dh='dirs -v'

#history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

#completion
#autoload -U compinit
#compinit

# my environment variable
export EDITOR=/usr/local/bin/vim
export MAIL=$HOME/Maildir

