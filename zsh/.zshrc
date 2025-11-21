# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting kubectl)

source $ZSH/oh-my-zsh.sh

source ~/.cache/wal/colors.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
  export EDITOR='nvim'
  fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.npm-global/bin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Quick directory navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias ~="cd ~"
alias code="cd ~/code"

# Common directories
alias docs="cd ~/Documents"
alias down="cd ~/Downloads"
alias config="cd ~/.config"
alias hypr="cd ~/.config/hypr"
alias dm="cd OneDrive/Desktop/ETH/1S/DiskMath/"
alias and="cd OneDrive/Desktop/ETH/1S/AnD/"
alias eprog="cd OneDrive/Desktop/ETH/1S/Eprog/"
alias epprog="cd programming/IdeaProjects/gduarte/"
alias linalg="cd OneDrive/Desktop/ETH/1S/LinAlg/"
alias lice="cd OneDrive/Desktop/lice"
alias ideas="cd Documents/ideas"
alias install="sudo pacman -S"




# Quick config edits
alias hyprc="$EDITOR ~/.config/hypr/hyprland.conf"
alias kittyc="$EDITOR ~/.config/kitty/kitty.conf"
alias nvimc="$EDITOR ~/.config/nvim/init.lua"
alias zshc="$EDITOR ~/.zshrc && source ~/.zshrc"

# Hyprland control
alias hlog="journalctl -u hyprland -f"
alias hreload="hyprctl reload"
alias hkill="hyprctl kill"
alias hclients="hyprctl clients"
alias hworkspaces="hyprctl workspaces"
alias hmonitors="hyprctl monitors"
alias hactive="hyprctl activewindow"
alias hbinds="hyprctl binds"

# Session management
alias reboot="systemctl reboot"
alias poweroff="systemctl poweroff"
alias suspend="systemctl suspend"

# Pacman shortcuts
alias update="sudo pacman -Syu && yay && flatpak update"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rs"
alias search="pacman -Ss"
alias local-search="pacman -Qs"
alias clean-cache="sudo pacman -Sc"
alias orphaned="pacman -Qtdq"
alias remove-orphaned="sudo pacman -Rns \$(pacman -Qtdq)"

# AUR helper (if using yay)
alias yays="yay -S"
alias yaysyu="yay -Syu"
alias yayr="yay -Rs"
alias yayq="yay -Qs"

# Modern replacements for classic commands
alias ls="exa --icons --group-directories-first"
alias ll="exa -l --icons --group-directories-first"
alias la="exa -la --icons --group-directories-first"
alias lt="exa --tree --icons --group-directories-first"
alias l="exa -l --icons --group-directories-first"

# bat for cat with syntax highlighting
alias cat="bat"

# Quick directory jumping with zoxide (if installed)
alias j="z"

# File operations
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias mkdir="mkdir -p"

# Quick edits
alias vim="nvim"
alias v="$EDITOR"

# Process management
alias psa="ps aux"
alias psg="ps aux | grep"
alias killg="killall -9"

# System info
alias df="df -h"
alias free="free -h"
alias du="du -h"
alias dus="du -h -d 1 | sort -hr"

# Hardware monitoring
alias temp="sensors"
alias gpu="nvidia-smi"  # if you have NVIDIA
alias disks="lsblk"

# Network
alias ip="ip -c"
alias ports="ss -tulpn"
alias wifi="nmcli dev wifi"

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"

# Docker (if used)
alias dps="docker ps"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# Common applications
alias fm="thunar ."  # or thunar, pcmanfm, etc.
alias browser="zen-browser"  # or your preferred browser
alias music="spotify"  # or your music player
alias mail="thunderbird"
alias yy="yazi"  # terminal file manager
alias c="clear"

# Quick config reload
reloadzsh() {
    source ~/.zshrc
    echo "Zsh config reloaded!"
}

# Create and cd into directory
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Quick archive extraction
extract() {
    if [ -f "$1" ] ; then
        case $1 in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar x "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Find files with fzf and open in nvim
vf() {
    local file
    file=$(fzf --query="$1" --select-1 --exit-0)
    [ -n "$file" ] && nvim "$file"
}

# Created by `pipx` on 2025-11-08 22:28:34
export PATH="$PATH:/home/gabriel/.local/bin"

# --- START SSH AGENT PERSISTENCE BLOCK (Simplified, Silent Version) ---
export SSH_ASKPASS=/usr/bin/qt4-ssh-askpass

# Path for the saved agent environment variables
AGENT_ENV_FILE="${HOME}/.ssh/ssh-agent-env"

# Use the old method (check file existence) but ensure silence on startup

# 1. Check for running agent
if [ -f "$AGENT_ENV_FILE" ]; then
    . "$AGENT_ENV_FILE" > /dev/null 2>&1
    if ! kill -0 "$SSH_AGENT_PID" 2>/dev/null; then
        rm "$AGENT_ENV_FILE"
        unset SSH_AGENT_PID
    fi
fi

if [ -z "$SSH_AGENT_PID" ]; then
    ssh-agent -s 2>/dev/null > "$AGENT_ENV_FILE"
    . "$AGENT_ENV_FILE" > /dev/null 2>&1
fi

SSH_KEY_FILE="$HOME/.ssh/id_ed25519"

if [ -f "$SSH_KEY_FILE" ] && ! ssh-add -l | grep -q "$(ssh-keygen -lf "$SSH_KEY_FILE" | awk '{print $2}')"; then
    ssh-add -q "$SSH_KEY_FILE" 2>/dev/null
fi
# --- END SSH AGENT PERSISTENCE BLOCK ---

# GO Configuration
export GOPATH=$HOME/.local/go
export PATH=$PATH:$GOPATH/bin
