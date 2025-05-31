# ~/.bashrc: executed by bash(1) for non-login shells.
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue
BPurple="\[\033[1;35m\]"      # Purple
BCyan="\[\033[1;36m\]"        # Cyan
BWhite="\[\033[1;37m\]"       # White

# Underline
UBlack="\[\033[4;30m\]"       # Black
URed="\[\033[4;31m\]"         # Red
UGreen="\[\033[4;32m\]"       # Green
UYellow="\[\033[4;33m\]"      # Yellow
UBlue="\[\033[4;34m\]"        # Blue
UPurple="\[\033[4;35m\]"      # Purple
UCyan="\[\033[4;36m\]"        # Cyan
UWhite="\[\033[4;37m\]"       # White

# Background
On_Black="\[\033[40m\]"       # Black
On_Red="\[\033[41m\]"         # Red
On_Green="\[\033[42m\]"       # Green
On_Yellow="\[\033[43m\]"      # Yellow
On_Blue="\[\033[44m\]"        # Blue
On_Purple="\[\033[45m\]"      # Purple
On_Cyan="\[\033[46m\]"        # Cyan
On_White="\[\033[47m\]"       # White

Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"

# Note: PS1 and umask are already set in /etc/profile. You should not
# need this unless you want different defaults for root.
# PS1='${debian_chroot:+($debian_chroot)}\h:\w\$ '
# umask 022

# You may uncomment the following lines if you want `ls' to be colorized:
export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'

# build/bin/pants-completion.bash
[[ -f ~/pants-completion.bash ]] && source pants-completion.bash
[[ -f /etc/bash_completion ]] && source /etc/bash_completion

export PS1=${On_Blue}${Time12h}${Color_Off}' '${Purple}'\u'${Color_Off}'@'${URed}'pilvik:'${Color_Off}${BYellow}${PathShort}${Color_Off}${Green}${Color_Off}'\$ '

alias ls='ls -F --color=always'
alias dir='dir -F --color=always'
alias cp='cp -iv'
alias rm='rm -i'
alias mv='mv -iv'
alias grep='grep --color=auto -in'
alias ..='cd ..'

# alias ll='ls -halF'
alias ll='eza -la -s type --icons'
alias la='ls -A'
alias l='ls -CF'

alias c7='chmod 777'
alias ctl='sudo systemctl'
alias clip='xclip -sel clip'
alias dc='sudo docker-compose'
alias dcd='sudo docker-compose -f docker-compose.dev.yml'

alias cls='clear'

alias de='deno run -A'
alias dr='dotnet run'
alias drq='dotnet run -v q --property WarningLevel=0 /clp:ErrorsOnly'
alias k-bl='dev build --skip-osiris --react-dev frontend && ./pants ng-killall'
alias k-up='apache2ctl start && dev start frontend'
alias k-dn='dev stop frontend && apache2ctl stop'

export PATH=$PATH:$HOME/.local/bin

# this is for vault
export LOGNAME=akoval
