 Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/robertrathmann/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/robertrathmann/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/robertrathmann/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/robertrathmann/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*' completer _complete _ignored _approximate

source /usr/local/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(fzf --zsh)"

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history 
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ---- Eza (better ls) -----
alias ls="eza --icons=always"

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"
alias cd="z"

# export PATH="/usr/local/opt/llvm@18/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm@18/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm@18/include"
# export PATH="/usr/local/opt/llvm@18/bin:$PATH"
# export MANPATH="/usr/local/opt/llvm@18/share/man:$MANPATH"
# export INFOPATH="/usr/local/opt/llvm@18/share/info:$INFOPATH"

export VCPKG_ROOT=/path/to/vcpkg
export PATH=$VCPKG_ROOT:$PATH
