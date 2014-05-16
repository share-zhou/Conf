# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	# PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@$(hostname -a)\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
	# PS1='${debian_chroot:+($debian_chroot)}\u@$(hostname -a):\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
	# PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@$(hostname -a): \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# sdcv,the dictionary used in bash
alias langdao-ce='sdcv -u "朗道汉英字典5.0"'
alias langdao-ec='sdcv -u "朗道英汉字典5.0"'

# solution to 'gvim can't create ubuntu menu proxy'
alias gvim='gvim -f'

# indent tool for c source code with kr coding style and 4 blanks for an indent
alias indent='indent -kr -i4'

# jdk-7-oracle instead of openjdk
JAVA_HOME=/usr/local/lib/jvm/jdk-7-oracle
CLASSPATH=.:$JAVA_HOME/lib

# mysql
#/usr/local/mysql-connector-java-5.1.24/mysql-connector-java-5.1.24-bin.jar

# log4j
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/log4j/log4j-1.2.14.jar
# mibble
MIBBLE_HOME=/usr/local/lib/JavaLibs/mibble
CLASSPATH=$CLASSPATH:$MIBBLE_HOME/mibble-mibs-2.9.3.jar
CLASSPATH=$CLASSPATH:$MIBBLE_HOME/mibble-parser-2.9.3.jar
CLASSPATH=$CLASSPATH:$MIBBLE_HOME/snmp6_0.jar
CLASSPATH=$CLASSPATH:$MIBBLE_HOME/grammatica-1.5.jar
# snmp4j
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/snmp4j/snmp4j-2.2.3.jar
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/snmp4j/snmp4j-2.2.3-javadoc.jar
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/snmp4j/snmp4j-agent-2.0.10a.jar
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/snmp4j/snmp4j-agent-jmx-2.0.0.jar
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/snmp4j/snmp4j-agentx-2.1.0.jar
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/snmp4j/snmp4j-clt.jar
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/snmp4j/snmp4j-smi.jar
# jdbc
CLASSPATH=$CLASSPATH:/usr/local/lib/JavaLibs/jdbc/classes12.jar;

export JAVA_HOME
export CLASSPATH

# for LD_LIBRARY_PATH
LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH

# tomcat
CATALINA_HOME=/opt/tomcat
CATALINA_BASE=/opt/tomcat

#our svn server
address=https://125.64.17.177/svn/hrms
export address
