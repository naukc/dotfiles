#!/bin/zsh
echo "--- Homebrew & Pakete installieren ---"

# Homebrew installieren (falls nicht vorhanden)
if ! command -v brew &>/dev/null; then
  echo "Homebrew wird installiert..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "Homebrew ist bereits installiert."
fi

brew update

# --- Paketlisten ---
PACKAGES=(
  stow neovim tmux git lazygit yazi zoxide
  fzf eza btop glow bat ripgrep fd jq curl
  gh
)
CASKS=(
  visual-studio-code alfred obsidian
  discord google-chrome vlc todoist
)
FONTS=(
  font-jetbrains-mono-nerd-font
)

# --- Installation ---
echo "Installiere Kern-Pakete..."
brew install ${PACKAGES[@]}

echo "Installiere GUI-Apps..."
brew install --cask ${CASKS[@]}

echo "Installiere Schriftarten..."
brew tap homebrew/cask-fonts
brew install --cask ${FONTS[@]}

brew cleanup
echo "✅ Homebrew & Pakete fertig."
