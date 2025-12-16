# } Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
precmd() {
  # Reset HOSTNAME to the local machine if in an SSH session
  if [ -n "$SSH_CONNECTION" ]; then
    export HOSTNAME=$(uname -n)
  fi
  
  # Set the terminal title to the current working directory if not in a Linux console
  if [[ $TERM != linux ]]; then
    print -Pn "\e]2;%~\a"
  fi
}

preexec () {
if [[ $TERM != linux ]]; then
print -Pn "\e]2;%~ :  $1\a"
fi
}
# export BROWSER='/usr/local/bin/w3m'
# export BROWSER='/Applications/Firefox.app'
export NODE_OPTIONS="--no-deprecation"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
export PATH=$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/Cellar:/home/celticlich/Library/Python/3.7/bin:/home/celticlich/.cargo/bin:/home/celticlich/.android-sdk-macosx/platform-tools/:$PATH
elif [[ "$OSTYPE" == "darwin24.0"* ]]; then 
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/salt
export PATH=$HOME/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/Cellar:/opt/homebrew/bin:/Users/celticlich/Library/Python/3.7/bin:/home/celticlich/.cargo/bin:/Users/celticlich/.local/bin:$PATH
fi

export DISABLE_AUTO_TITLE='true'

# panes
# set -g pane-border-fg black
# set -g pane-active-border-fg brightred


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="steeef"
ZSH_THEME="powerlevel10k/powerlevel10k"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
docker
docker-compose
fzf
fzf-tab
)

source $ZSH/oh-my-zsh.sh

# ##################################################################
#  FZF Exports
# ##################################################################

export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob "!.git/*""
export FZF_DEFAULT_OPTS="-m"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_BREW_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || brew info {}) 2> /dev/null | head -200' --select-1 --exit-0"
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p 65%'

# ##################################################################
# Source
# ##################################################################
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f $HOME/git/dfiles/.zsh_aliases ] && source $HOME/git/dfiles/.zsh_aliases
[ -f $HOME/git/dfiles/.zsh_functions ] && source $HOME/git/dfiles/.zsh_functions
[ -f $HOME/.mymacros.bash ] && source $HOME/.mymacros.bash
[ -f $HOME/git/forgit/forgit.plugin.zsh ] && source $HOME/git/forgit/forgit.plugin.zsh
[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [[ -f "/usr/bin/zoxide" ]]; then
    eval "$(zoxide init zsh)"
    # echo "zoxide loaded"
  else
    echo "zoxide does not exist"
fi


# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export BW_SESSION=""

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh