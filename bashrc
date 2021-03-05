# .bashrc on macOS
# made by hiropy
# jan 2021
# last modified in mar 2021

# bash major version
major_ver=${BASH_VERSINFO[0]}

# '.' must be included for use of directory completion without 'cd'.
export PATH=/bin:/usr/bin:/usr/local/bin:/opt/X11/bin:/sbin:/usr/sbin:.
umask  022

if [ $UID -eq 0 ]
then
    # Root user
    export PS1="\[\e[1;31m\][\w]\[\e[m\] "
else
    if [[ -z "${REMOTEHOST}" ]]
    then
        # other users
        export PS1="\[\e[1;36m\][\w]\[\e[m\] "
    else
        # remote host
        export PS1="\[\e[1;30m\][\w]\[\e[m\] "
    fi
fi

HISTSIZE=256
HISTFILESIZE=256
HISTCONTROL=ignoredups
shopt -s histappend

# incremental history search
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# autoexpand with tab
if [ major_ver == "4" ]
then
    # cd with dir path
    shopt -s autocd
    shopt -s direxpand
fi
bind "TAB:menu-complete"
bind 'set match-hidden-files off'
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

export    LC_ALL=ja_JP.UTF-8
export    LANG=ja          # For history-search working well.
export    PERL_BADLAN=0    # For not printing Perl warning.
export    BLOCKSIZE=K
export    CLICOLOR         # To colorize ls
export    CLICOLOR_FORCE=1 # To colorize ls redirection output
export    LSCOLORS="Axfxxxxxbxhehebxbxbxbx"
export    LS_COLORS="no=00:fi=00:di=01:ln=35:pi=00:so=00:bd=37;40:cd=37;44:ex=31"

# For node.brew
export    NODEBREW_HOME=/usr/local/var/nodebrew/current
export    NODEBREW_ROOT=/usr/local/var/nodebrew
export    PATH=${PATH}:${NODEBREW_HOME}/bin

# complete    cd='p/1/d/'
# complete    emacs  'p/*/t/'
# complete    git     'p/1/(clone init add mv reset rm bisect grep log show status branch checkout commit diff merge rebase tag fetch pull push help)/'
# complete    docker 'p/1/(start restart pause unpause stats rm rmi ps logs images exec build run volume network version compose tag scan)/'

alias    mv='mv -i'
alias    cp='cp -i'
alias    ll='ls -Alt | more -R'
# alias    cd='pushd \!*'
alias    dirs='dirs -v'