# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi
alias vi='vim'
alias ls='ls -FG'

# ターミナルの左側設定
PS1="[\u@\h \W]\$ "
