#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
# PS1='[\u \W]-> '
PS1='[\u \W]\$ '

alias ls='ls --color=auto'
alias ll='clear ; ls -AltrhGF'
alias l='clear ; ls -AF'

alias grep='grep --color=auto'
alias obsidian='obsidian --ozone-platform-hint=auto'
alias cdo='cd /mnt/nvme0n1p3/Users/11rem/Documents/Obsidian_Vault/Kursi/'
alias vim='nvim'
alias cale='cal -3wm'

# Git
alias gits='git status -s'
alias gitl='git log --oneline --graph -10'

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"
export RUBYOPT="-W0"
# export MANPAGER='nvim +Man!'

export EDITOR=nvim
set -o vi
bind -m vi-insert '\C-l':clear-screen

# . "$HOME/.cargo/env"
