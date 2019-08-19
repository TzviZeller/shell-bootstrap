#Ignore duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups

#Append to the history file, don't overwrite it
shopt -s histappend

# Set history length HISTSIZE and HISTFILESIZE
HISTSIZE=1000
HISTFILESIZE=2000

#Check window size after each command
shopt -s checkwinsize

#Color for ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
fi

#Fancy Prompt
force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
    else
        color_prompt=
    fi
fi
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

#Aliases
alias redshift='redshift -ov -t 3500:3500'
alias ll='ls -alF'
