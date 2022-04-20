### BEGIN SET VSCODE TO BE THE DEFAULT EDITOR
export EDITOR="code -w"
### END SET VSCODE TO BE THE DEFAULT EDITOR
### BEGIN Initialize Starship Prompt
eval "$(starship init zsh)"
### END Initialize Starship Prompt
### BEGIN Common Useful Shell Aliases
source /etc/grc.zsh
### END Common Useful Shell Aliases
### BEGIN Add common directories to the PATH
export PATH=$HOME/.local/bin:$PATH
### END Add common directories to the PATH
### BEGIN INTIALIZE NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion"
### END INTIALIZE NVM
. /usr/share/autojump/autojump.sh
export DENO_INSTALL="/home/echo/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

[ -f "/home/echo/.ghcup/env" ] && source "/home/echo/.ghcup/env" # ghcup-env
### BEGIN Common Useful Shell Aliases for WSL
alias open='explorer.exe'
alias wsl='wsl.exe'
### END Common Useful Shell Aliases for WSL
### BEGIN Add SSH Agent startup
env=~/.ssh/agent.env
agent_load_env () { test -f "$env" && . "$env" >| /dev/null ; }

agent_start () {
  (umask 077; ssh-agent >| "$env")
  . "$env" >| /dev/null ; }

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state=$(ssh-add -l >| /dev/null 2>&1; echo $?)

if [ ! "$SSH_AUTH_SOCK" ] || [ $agent_run_state = 2 ]; then
  agent_start
  ssh-add
elif [ "$SSH_AUTH_SOCK" ] && [ $agent_run_state = 1 ]; then
  ssh-add
fi

unset env
### END Add SSH Agent startup
code-quotes

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}

precmd_functions+=(set_win_title)
# BEGIN ANSIBLE MANAGED BLOCK: pyenv
if [ -e "$HOME/.pyenv/.pyenvrc" ]; then
  source $HOME/.pyenv/.pyenvrc
fi
# END ANSIBLE MANAGED BLOCK: pyenv
alias dit='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

