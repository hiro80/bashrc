# .bashrc on macOS
# made by hiropy
# jan 2021
# last modified in mar 2021

# '.' must be included for use of directory completion without 'cd'.
export PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:.
umask  022

if [ $UID -eq 0 ]
then
    # Root user
    export PS1="\[\e[;31m\][\w]\[\e[m\] "
else
    if [[ -z "${REMOTEHOST}" ]]
    then
        # other users
        export PS1="\[\e[;36m\][\w]\[\e[m\] "
    else
        # remote host
        export PS1="\[\e[;30m\][\w]\[\e[m\] "
    fi
fi

# command history
HISTSIZE=256
HISTFILESIZE=256
HISTCONTROL=ignoredups
shopt -s histappend

# incremental history search
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'


# bash major version
if [ ${BASH_VERSINFO[0]} -eq 4 ]
then
    # cd with dir path
    shopt -s autocd
    shopt -s direxpand
fi

# Do not search PATH for completion candidates 
# when performing command completion for blank lines
shopt -s no_empty_cmd_completion

# autoexpand with tab
bind "TAB:menu-complete"
bind 'set match-hidden-files off'
bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"

export    LANG=en_US.utf8
export    PERL_BADLAN=0    # For not printing Perl warning.
export    BLOCKSIZE=M
export    CLICOLOR         # To colorize ls
export    CLICOLOR_FORCE=1 # To colorize ls redirection output
export    LSCOLORS="Axfxxxxxbxhehebxbxbxbx"
export    LS_COLORS="no=00:fi=00:di=01:ln=35:pi=00:so=00:bd=37;40:cd=37;44:ex=31"

# For pyenv
if [ ${PYENV_ROOT} ]
then
    export    PATH=${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}
fi

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
alias    ll='ls -Alt | more'
# alias    cd='pushd \!*'
alias    dirs='dirs -v'
