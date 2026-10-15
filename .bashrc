#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
# PS1='[\u \W]-> '
PS1='[\u \W]\$ '

# Alias
alias ls='ls --color=auto'
alias ll='clear ; ls -AltirhGF'
alias lll='ls -AltrhGF | tail -1'
alias l='clear ; ls -AF'

alias grep='grep --color=auto'
alias obsidian='obsidian --ozone-platform-hint=auto'
alias cdo='cd /mnt/nvme0n1p3/Users/11rem/Documents/Obsidian_Vault/Kursi/'
alias vim='nvim'
alias ivm='nvim'
alias vimdiff='nvim -d'
alias cale='cal -3wm'

# Git
alias gits='git status -s'
alias gitl='git log --oneline --all --graph -10'

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"
export RUBYOPT="-W0"

# Vim/Nvim
export EDITOR=nvim
export SUDO_EDITOR=nvim
set -o vi
bind -m vi-insert '\C-l':clear-screen

eval "$(zoxide init bash)"
