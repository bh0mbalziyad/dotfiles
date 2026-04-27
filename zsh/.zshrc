export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export GPG_TTY=$(tty)
# make claude use system installed ripgrep
export USE_BUILTIN_RIPGREP=0

# password store

export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_EXTENSIONS_DIR="$HOME/.password-store/.extensions"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"


# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Mysql
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
export NVM_DIR="$HOME/.nvm"

export FZF_DEFAULT_OPTS="--preview 'if [ -f {} ]; then bat --color=always {}; else echo \"{}\"; fi'"

# tmux session wizard
export PATH="$XDG_CONFIG_HOME/tmux/plugins/tmux-session-wizard/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/private/tmp/google-cloud-sdk/path.zsh.inc' ]; then . '/private/tmp/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/private/tmp/google-cloud-sdk/completion.zsh.inc' ]; then . '/private/tmp/google-cloud-sdk/completion.zsh.inc'; fi


os_name=$(uname)
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



# brew cli completions

if [[ "$os_name" == "Darwin" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$os_name" == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi


# completions for apps installed with brew
if [ -d /opt/homebrew/share/zsh/site-functions ]; then
  fpath=($fpath /opt/homebrew/share/zsh/site-functions)
fi

# fzf completions
if command -v fzf >/dev/null 2>&1; then
  eval "$(fzf --zsh)"
fi

# zinit & plugins directory
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::sudo
zinit snippet OMZP::git
zinit snippet OMZP::aws
zinit snippet OMZP::command-not-found

# load completions
autoload -U compinit && compinit
zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward
# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down


# edit current inline command inside editor
autoload -U edit-command-line; 
zle -N edit-command-line; 
bindkey '^Fc' edit-command-line;

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'


if [ -f ~/.zsh.local ]; then
  source ~/.zsh.local
fi


if [[ "$os_name" == "Darwin" ]]; then
  PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init --cmd cd zsh)"
fi

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# activate nvm default node so its bin wins over /opt/homebrew/bin
if command -v nvm >/dev/null 2>&1; then
  nvm use default --silent >/dev/null 2>&1
fi


# uv
if command -v uv >/dev/null 2>&1; then
  eval "$(uv generate-shell-completion zsh)"
fi
