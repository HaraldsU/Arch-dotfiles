#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
# PS1='[\u \W]-> '
# PS1='\e[31m[\e[33m\u \e[31m\W]\e[33m \$\e[0m '
PS1='\e[35m[\e[34m\u \e[35m\W]\e[34m \$\e[0m '

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

# alias tldr='tldr --color=always'
t () {
	tldr $1 --color=always | less -R
}

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

# Taken from https://github.com/bahamas10/dotfiles/blob/master/bashrc

# Support colors in less
export MANROFFOPT="-c"
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;33;44m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[4;1;32m'
export LESS_TERMCAP_mr=$'\e[7m'
export LESS_TERMCAP_mh=$'\e[2m'
export LESS_TERMCAP_ZN=$'\e[74m'
export LESS_TERMCAP_ZV=$'\e[75m'
export LESS_TERMCAP_ZO=$'\e[73m'
export LESS_TERMCAP_ZW=$'\e[75m'

hsv_to_rgb() {
	awk -v h="$1" -v s="$2" -v v="$3" 'BEGIN {
		s /= 100; v /= 100
		c  = v * s
		hp = (h % 360) / 60
		d  = hp % 2 - 1; if (d < 0) d = -d
		x  = c * (1 - d)
		if      (hp < 1) { r=c; g=x; b=0 }
		else if (hp < 2) { r=x; g=c; b=0 }
		else if (hp < 3) { r=0; g=c; b=x }
		else if (hp < 4) { r=0; g=x; b=c }
		else if (hp < 5) { r=x; g=0; b=c }
		else             { r=c; g=0; b=x }
			m = v - c
			printf "%d %d %d\n", (r+m)*255+0.5, (g+m)*255+0.5, (b+m)*255+0.5
		}'
}

truecolor-rainbow() {
	local saturation=100
	local value=100
	local width=77
	local i r g b
	for ((i = 0; i < width; i++)); do
		local hue=$(awk -v i="$i" -v w="$width" 'BEGIN { print i / w * 300 }')
		read -r r g b < <(hsv_to_rgb "$hue" "$saturation" "$value")
		printf '\033[48;2;%d;%d;%dm ' "$r" "$g" "$b"
	done
	printf '\e[0m\n'
}

eval "$(zoxide init bash)"
