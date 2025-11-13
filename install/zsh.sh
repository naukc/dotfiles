#!/bin/zsh
echo "--- Zsh & Oh My Zsh einrichten ---"

# Oh My Zsh installieren (falls nicht vorhanden)
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Oh My Zsh wird installiert..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "Oh My Zsh ist bereits installiert."
fi

# Zsh-Plugins (Autosuggestions, Syntax Highlighting) klonen
# (Stow wird die .zshrc verlinken, die diese Plugins erwartet)
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "✅ Zsh-Plugins fertig."
