# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '

### CHANGE TITLE OF TERMINALS
case ${TERM} in
  alacritty|st|konsole*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
        ;;
  screen*)
    PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
    ;;
esac

##------------------- PROMPT -----------------------##

function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  # Long form
  git rev-parse --abbrev-ref HEAD 2> /dev/null
 # Short form
  # git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

prompt_comment() {
    DIR="$HOME/.local/share/promptcomments/"
    MESSAGE="$(find "$DIR"/*.txt | shuf -n1)"
    cat "$MESSAGE"
}

#PS1="\e[00;36m\]┌─[ \e[00;37m\]\T \d \e[00;36m\]]──\e[00;31m\]>\e[00;37m\] \u\e[00;31m\]@\e[00;37m\]\h\n\e[00;36m\]|\n\e[00;36m\]└────\e[00;31m\]> \e[00;37m\]\w \e[00;31m\]\$ \e[01;37m\]"
PS1="\[\e[01;39m\]{ \[\e[01;32m\]\w \[\e[01;39m\]} \[\e[01;32m\]\[\$ \]\[\e[01;39m\] \[\e[1;37m\]"
#PS1="\[\e[1;36m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\[\033[00m\]\n\w\[\e[1;31m\] \[\e[1;36m\]\[\e[1;37m\] "
#PS1="\[\e[1;36m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\n\[\033[1;33m\]  \[\e[1;37m\] \w \[\e[1;36m\]\[\e[1;37m\] "

##------------------- ALIAS -----------------------##
alias add='sudo xbps-install'
alias remove='sudo xbps-remove -R'
alias clean='sudo xbps-remove -o'
alias cc='sudo xbps-remove -O'
alias up='sudo xbps-install -Su'
alias restart='xcheckrestart'
alias search='xbps-query -Rs'
alias ls='exa -a -G --icons --color=always --group-directories-first' # my preferred listing
alias la='exa -al -G --icons --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l -G --icons --color=always --group-directories-first'  # long format
alias ..='cd ..'
alias gcl='git clone'
alias cat='bat --theme ansi'
alias reboot='sudo reboot'

figlet KDE Plasma

neofetch


