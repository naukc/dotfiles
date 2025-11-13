# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]];
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
fpath=($HOME/.zsh/completions $fpath)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Mein Super-Update-Befehl
alias upgrade="echo '🚀 Starte Homebrew Updates...' && brew update && brew upgrade && brew cleanup && echo '🍎 Starte macOS & App Store Updates...' && sudo softwareupdate -i -a && echo '✅ Alles erledigt!'"
alias ic='cd "$HOME/Library/Mobile Documents/com~apple~CloudDocs"'
alias ho='cd "$HOME"'

# Aktivierung von Starship
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Neovim als Standard Editor festlegen
export EDITOR='nvim'
export VISUAL='nvim'

# yazi intergration
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# Funktion zum Suchen und Öffnen in nvim
fzopen() {
  local file
  file=$(fd --type f | fzf --preview 'bat --color=always {}') # Fügt eine Vorschau mit bat hinzu (falls installiert)
  if [[ -n $file ]]; then
    nvim "$file"
  fi
}

# eza configuration
alias ls='eza --icons'       # Ersetzt einfaches ls
alias l='eza -l --icons'      # Wie ls -l
alias la='eza -al --icons'    # Wie ls -la
alias lt='eza --tree --level=1 --icons' # Baumansicht
alias llt='eza -al --tree --level=1 --icons' # Baumansicht mit Details
alias lg='eza -al --git --icons' # Mit Git-Status

# Alias für tmux: Verbindet sich mit "main" oder erstellt sie
alias t='tmux attach-session -t main || tmux new-session -s main'

# -----------------------------------------------------------------
# Alias/Funktion für Neovim (nv) mit fzf-Suche
# -----------------------------------------------------------------
nv() {
  local files
  # Finde alle Dateien (fd) und leite sie an fzf weiter
  # --multi: Erlaube Mehrfachauswahl mit Tab
  # --preview: Zeige bat-Vorschau
  # Wir nutzen 'find' statt 'fd' für den Fall, dass fd nicht da ist,
  # aber da du fd hast, könnten wir auch 'fd --type f' nehmen.
  files=$(fd --type f --hidden --exclude .git | fzf --multi --preview "bat --color=always {}")

  # Wenn 'files' nicht leer ist (d.h. du hast Enter gedrückt)
  if [[ -n "$files" ]]; then
    # Öffne alle ausgewählten Dateien in nvim
    # 'tr' wandelt die Zeilenumbrüche von fzf in Leerzeichen um
    echo "$files" | tr '\n' ' ' | xargs nvim
  fi
}

# -----------------------------------------------------------------
# Alias/Funktion für VS Code (co) mit fzf-Suche
# -----------------------------------------------------------------
co() {
  local files
  # Derselbe fzf-Befehl
  files=$(fd --type f --hidden --exclude .git | fzf --multi --preview "bat --color=always {}")

  if [[ -n "$files" ]]; then
    # Öffne alle ausgewählten Dateien in VS Code
    echo "$files" | tr '\n' ' ' | xargs code
  fi
}
