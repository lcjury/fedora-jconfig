# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

#alias
alias tmux="tmux -2"

# Colors
# Fancy bash

PS1='\[$LightBlue\][\[$LightGreen\]\u\[$LightBlue\]:\[$LightGreen\]\h\[$LightBlue\]][\[$LightGreen\]\w\[$LightBlue\]]\$\[$NC\] '
